package com.ttms.dao;
import com.ttms.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;



@Repository("SaleDAO")

public interface SaleDAO {
    public void insertSale(@Param(value = "emp_id") int emp_id,
                           @Param(value = "sale_time") String sale_time,
                           @Param(value = "sale_payment") double sale_payment,
                           @Param(value = "sale_change") double sale_change,
                           @Param(value = "sale_type") int sale_type,
                           @Param(value = "sale_status") int sale_status);

    public void deleteSale(int slae_id);
    public void updateSale(Sale sale);

    public int SearchSale(Ticket ticket);


    public int selectSale_id(@Param(value = "emp_id") int emp_id,
                             @Param(value = "sale_time") String sale_time);

    public Sale selectPlayBySale_id(int sale_id);
    public List<Sale> selectSaleByEmp_id(int emp_id);
    public List<Sale> selectSaleBySale_time(String sale_time);

    public List<Sale> selectSaleBySale_status(int sale_status);
    public List<Sale> selectSaleBySale_type(int sale_type);

    public List<Sale> selectSale();
    public void updateUser(Sale sale);
    public void updateStatus(Sale sale);
    public void updateTicket(Sale sale);
    public  List<Sale> SearchSalebyuser(int user_id);
    public Sale_item Searchbysaleid(Sale sale);
    public List<Sale> selectSaleByUser_id(User_sale user_sale);
}
