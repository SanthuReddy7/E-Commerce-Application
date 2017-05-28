package com.emusicstore.controller;

import com.emusicstore.dao.ProductDao;
import com.emusicstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by Le on 1/2/2016.
 */

@Controller
public class HomeController {

    private Path path;

    @Autowired
    private ProductDao productDao;

    @RequestMapping("/")
    public String home() {
        return "home";
    }


    @RequestMapping("/productList")

    public String getProducts(Model model) {
        List <Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);

        return "productList";
    }

    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable String productId, Model model) throws IOException {
        try {


            Product product = productDao.getProductById(productId);
            model.addAttribute(product);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "viewProduct";

    }
    @RequestMapping("/admin")
    public String adminPage() throws Exception{
        try{}
        catch (Exception e) {
        e.printStackTrace();}
        return "admin";
    }
    @RequestMapping("/admin/productInventory")
    public String productInventory(Model model){
        List<Product> products=productDao.getAllProducts();
        model.addAttribute("products",products);

        return "productInventory";
    }
    @RequestMapping("/admin/productInventory/addProduct")
    public String addProduct(Model model){
        Product product= new Product();
        product.setProductCatagory("instrument");
        product.setProductCondition("new");
        product.setProductStatus("active");

        model.addAttribute("product" ,product);

        return "addProduct";
    }
    @RequestMapping(value = "/admin/productInventory/addProduct",method = RequestMethod.POST)
public String addProductPost(@ModelAttribute("product") Product product, HttpServletRequest request){
        productDao.addProduct(product);

        MultipartFile productImage=product.getProductImage();
        String rootDirectory=request.getSession().getServletContext().getRealPath("/");
        path= Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
        if(productImage !=null&&!productImage.isEmpty()){
            try{
                productImage.transferTo(new File(path.toString()));
            }catch (Exception e){
                e.printStackTrace();
                throw new RuntimeException("Product image saving failed",e);
            }
        }


        return "productInventory";//also we can use return "redirect:/admin/productInventory";
    }
    @RequestMapping("/admin/productInventory/deleteProduct/{id}")
    public String deleteProduct(@PathVariable String id, Model model) throws IOException {
        try {

productDao.deleteProduct(id);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/productInventory";

    }

}


