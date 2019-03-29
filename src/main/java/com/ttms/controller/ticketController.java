package com.ttms.controller;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.ttms.dao.SaleDAO;
import com.ttms.dao.SeatDAO;
import com.ttms.dao.TicketDAO;
import com.ttms.entity.*;
import com.ttms.service.*;
import com.ttms.serviceImpl.SaleItemServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.codehaus.jackson.map.util.JSONPObject;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;




@Controller("TicketController")
@RequestMapping("/ticket")
public class ticketController {


    @Autowired
    SeatService seatService;
    @Autowired
    StudioService studioService;
    @Autowired
    PlayService playService;
    @Autowired
    ScheduleService scheduleService;
    @Autowired
    TicketService ticketService;
    @Autowired
    SaleService saleService;
    @Autowired
    SaleItemService saleItemService;
    @Autowired
    User_saleService user_saleService;
    @Autowired
    TicketDAO ticketDAO;
    @Autowired
    SeatDAO seatDAO;
    @Autowired
    SaleDAO saleDAO;



    @RequestMapping("/BackTicket")
    public ModelAndView showSale(HttpServletRequest request){
        return new ModelAndView("/manager/ticket/BackTicket");
    }
    @RequestMapping("/seatshow")
    public ModelAndView seatShow(HttpServletRequest request){

        String studio_id = request.getParameter("studioid");
        int id = Integer.parseInt(studio_id);
        Studio studio = studioService.selectStudioByStudio_id(id);
        List<Studio> list = studioService.selectSpecialStudio(id);
        int[][] seat_statu = seatService.selectSeatByStudio_id(id);
        List<Studio> list1 = studioService.selectStudio();
        List<Play> playList = playService.selectPlay();
        List<Schedule> scheduleList = scheduleService.selectSchedule("");
        request.setAttribute("list1", list1);
        request.setAttribute("play", playList);
        request.setAttribute("schedule", scheduleList);

        request.setAttribute("list", list);
        request.setAttribute("studio", studio);
        request.setAttribute("seat_statu", seat_statu);

        return new ModelAndView("/manager/ticket/Seats");
    }
    //票、座位
    @RequestMapping("/seatsshow")
    public ModelAndView seatsShowPage(HttpServletRequest request){

        String studio_id = request.getParameter("studioid");
        if(studio_id==null){
            return this.seatShowPage(request);
        }else {
            int id=Integer.parseInt(studio_id);
            Studio studio = studioService.selectStudioByStudio_id(id);
            List <Studio> list = studioService.selectSpecialStudio(id);
            int[][] seat_statu = seatService.selectSeatByStudio_id(id);

            request.setAttribute("list", list);
            request.setAttribute("studio", studio);
            request.setAttribute("seat_statu", seat_statu);
            return new ModelAndView("/manager/ticket/Seats");
        }
    }

   // 查询play票的详情
    @RequestMapping("/ticketseats")
    public ModelAndView ticketShow(HttpServletRequest request){
        int studio_id = Integer.parseInt(request.getParameter("stu"));
        int sched_id = Integer.parseInt(request.getParameter("sche"));
        Schedule schedule = new Schedule();
        schedule.setSched_id(sched_id);

        int[][]  seats = seatService.selectSeatByStudio_id(studio_id);
        Studio studio = studioService.selectStudioByStudio_id(studio_id);
        Schedule schedule1 = scheduleService.selectScheduleBySched_id(sched_id);
        request.setAttribute("studio",studio);
        request.setAttribute("schedule", schedule1);
        request.setAttribute("seat_statu",seats);

        List<Seat> seatlist=seatService.selectSeat_idByStudio_id(studio_id);
        List<Ticket> ticketList=new ArrayList <Ticket>();
        for (int i = 0; i <seatlist.size() ; i++) {
            Ticket ticket=new Ticket();
            ticket.setSeat_id(seatlist.get(i).getSeat_id());
            ticket.setSched_id(sched_id);
            Ticket ticket1=ticketDAO.SearchTicket2(ticket);
            ticketList.add(ticket1);
        }
        System.out.println(ticketList.get(63).getTicket_status());
        request.setAttribute("ticketList",ticketList);

        return new ModelAndView("/ordinary/seats");
    }

    @RequestMapping("/seatticketshow")
    public ModelAndView seatShowPage(HttpServletRequest request) {

        List<Studio> list = studioService.selectStudio();
        List<Play> playList = playService.selectPlay();
        List<Schedule> scheduleList = scheduleService.selectSchedule(null);

        request.setAttribute("list", list);
        request.setAttribute("play", playList);
        request.setAttribute("schedule", scheduleList);

        return new ModelAndView("/manager/ticket/Seat");

    }

    @RequestMapping("/lockTicket")
    public ModelAndView lockTicket(HttpServletRequest request) {

        String data = request.getParameter("data");
        JSONObject object = new JSONObject(data);

        int row = object.getInt("row");

        int col = object.getInt("col");

        int studio_id = object.getInt("studio");

        int sched_id = object.getInt("sched");

        int action = object.getInt("flag");

        Studio name = studioService.selectStudioByStudio_id(studio_id);
        Seat seat = seatService.selectSeatByPosition2(name.getStudio_name(),row,col);

        Schedule schedule = scheduleService.selectScheduleBySched_id(sched_id);

        int ticket_id;
        Ticket ticket = new Ticket();
        ticket.setSched_id(sched_id);
        ticket.setSeat_id(seat.getSeat_id());

       // ticketDAO.updataTicket(seat.getSeat_id(),sched_id);

        return new ModelAndView("");

    }

    @RequestMapping("/Saleitem")
    public ModelAndView Salewithsomething(HttpServletRequest request) {

        String datas = request.getParameter("data");
        JSONObject object = new JSONObject(datas);
        String data = object.getString("orders");
        Double price = object.getDouble("price");
        int studio_id = object.getInt("studio");
        int sched_id = object.getInt("sched");
        String[] positoion = data.split("\\|");

        Sale sale=new Sale();

        sale.setSale_type(1);
        sale.setSale_status(0);
        sale.setSale_payment(price);
        System.out.println(price+"======>");
        String sale_time=String.valueOf(new Date().getTime());

        System.out.println(sale_time+"======>");
        sale.setSale_time(sale_time);
        sale.setSale_change(0.00);
        int emp_id=Integer.parseInt(String.valueOf(request.getSession().getAttribute("names")));
        System.out.println(emp_id+"======>");
        sale.setEmp_id(emp_id);
        System.out.println(sale.toString());
       // saleDAO.insertSale(emp_id,sale_time,price,0.00,1,0);

        for(int i=0; i<positoion.length; i++) {
            String [] seat=positoion[i].split(",");
            int row= Integer.parseInt(seat[0]);
            int col=Integer.parseInt(seat[1]);
            System.out.println(row+"---->"+col);
            Seat seat1=seatDAO.selectSeatByPosition(studio_id,row,col);
            int seat_id=seat1.getSeat_id();
            ticketDAO.updataTicket(seat_id,sched_id);
//            int ticket_id = ticketDAO.selectBySeat_idAndSched_id(seat_id,sched_id);
//            int sale_id=saleDAO.selectSale_id(emp_id,sale_time);
//            Sale_item sale_item=new Sale_item();
//            sale_item.setSale_ID(sale_id);
//            sale_item.setTicket_id(ticket_id);
//            sale_item.setSale_item_price(price/positoion.length);
//            saleItemService.insertSaleItem(sale_item);
        }
        return new ModelAndView("/manager/ticket/detail");
    }

    @RequestMapping("/backticket")
    public ModelAndView backticket(HttpServletRequest request) {

        Sale sale = new Sale();
        Ticket ticket = new Ticket();
        Seat seat;
        Sale_item sale_item  = new Sale_item();



        sale.setSale_ID((Integer.parseInt(request.getParameter("sale"))));
        sale.setSale_status(0);
        sale.setEmp_id(0);

        sale_item = saleService.Searchbysaleid(sale);

        ticket    = saleItemService.Searchbysaleitemid(sale_item);

        ticket.setTicket_status(0);

        saleService.updateStatus(sale);

        ticketService.updateTicketStatus(ticket);
        seat      = ticketService.serchforseat(ticket);
        seat.setSeat_status(0);
        seatService.updateSeatStatus(seat);


        List<User_sale>  user_sales;
        User_sale user_sale  = new User_sale();
        user_sale.setUser_id((Integer) request.getSession().getAttribute("names"));
        user_sales = user_saleService.selectUser_sale(user_sale);

        request.setAttribute("ticketdetail", user_sales);
     return new ModelAndView("/ordinary/order");
   //     return new ModelAndView("");
    }

    @RequestMapping("/searchbySale")
    public ModelAndView searchbySale(HttpServletRequest request) {

        System.out.println("dijici");
        List<User_sale>  user_sales;
        User_sale user_sale  = new User_sale();
        user_sale.setUser_id((Integer) request.getSession().getAttribute("names"));
        user_sales = user_saleService.selectUser_sale(user_sale);

        for (User_sale u :user_sales
             ) {
            System.out.println(u.getCol()+"    "+u.getRow());
        }


        request.setAttribute("ticketdetail", user_sales);
        return new ModelAndView("/ordinary/order");

    }

    @RequestMapping("/searchbySale1")
    @ResponseBody
    public List<User_sale> searchbySale1(@Param("sched_id") int sched_id) {

        System.out.println(sched_id);
        System.out.println("dijici");
        List<User_sale>  user_sales = null;
        user_sales = user_saleService.selectUser_saleByScheduleId(sched_id);
        return  user_sales;

    }

}
