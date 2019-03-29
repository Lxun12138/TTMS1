package com.ttms.controller;

import com.ttms.dao.ScheduleDAO;
import com.ttms.dao.TicketDAO;
import com.ttms.entity.*;
import com.ttms.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller("ScheduleController")
@RequestMapping("/schedule")
public class ScheduleController {


    @Autowired
    ScheduleService scheduleService;
    @Autowired
    PageService pageService;
    @Autowired
    StudioService studioService;
    @Autowired
    PlayService playService;
    @Autowired
    TicketDAO ticketDAO;
    @Autowired
    ScheduleDAO scheduleDAO;

    @Autowired
    SeatService seatService;
    @Autowired
    TicketService ticketService;



    @RequestMapping("/selectSched")
    @ResponseBody
    public List<Schedule> selectSched(@Param("play_name") String name){
        System.out.println(name);
        List list = null;
        list = scheduleService.selectSchedule(name);
        return list;
    }
    @RequestMapping("/showsched")
    public ModelAndView showSchedPage(HttpServletRequest request){


        String pageNow = request.getParameter("pageNow");
        pageService.showScheduleByPage(request, pageNow);
        return new ModelAndView("/manager/schedule/Schedule");

    }

    @RequestMapping("/addschedshow")
    public ModelAndView addSchedShowPage(HttpServletRequest request){

        String pageNow = request.getParameter("pageNow");
        pageService.showScheduleByPage(request, pageNow);
        return new ModelAndView("/manager/schedule/AddScheduleShow");

    }


    @RequestMapping("/addsched")
    public ModelAndView addSchedPage(HttpServletRequest request){

        String studio_id = request.getParameter("studioid");
        System.out.println("studio_id"+studio_id);
        String play_id = request.getParameter("playid");
        String sched_time = request.getParameter("schedtime");
        System.out.println(sched_time);
        String sched_ticket_price = request.getParameter("schedprice");
        String errors = scheduleService.addSchedule(studio_id, play_id, sched_time, sched_ticket_price);
        //  Schedule schedule=new Schedule();
        int studio_id1=Integer.parseInt(studio_id);
        int play_id1=Integer.parseInt(play_id);
        Double sched_ticket_price1=Double.parseDouble(sched_ticket_price);

        int sched_id=scheduleDAO.searchSchIdByInfo(studio_id1,play_id1,sched_time,sched_ticket_price1);

        List<Seat> seatList=seatService.selectSeat_idByStudio_id(Integer.parseInt(studio_id));
        for (int i = 0; i <seatList.size() ; i++) {
            Ticket ticket=new Ticket();
            ticket.setSched_id(sched_id);
            if(seatList.get(i).getSeat_status()==1 || seatList.get(i).getSeat_status()==-1){
                ticket.setTicket_status(9);
            }else{
                ticket.setTicket_status(0);
            }
            ticket.setSeat_id(seatList.get(i).getSeat_id());
            ticket.setTicket_price(Double.parseDouble(sched_ticket_price));
            ticketService.insertTicket(ticket);
        }
        request.setAttribute("errors", errors);
        return new ModelAndView("/manager/schedule/AddSchedule2");

    }

    @RequestMapping("/updatesched")
    public ModelAndView updateSchedPage(HttpServletRequest request){

        String sched_id = request.getParameter("id");
        String studio_name = request.getParameter("studioname");
        String play_name = request.getParameter("playname");
        String sched_time = request.getParameter("schedtime");
        String sched_ticket_price = request.getParameter("schedprice");
        String errors = scheduleService.updateSchedule(sched_id, studio_name, play_name, sched_time, sched_ticket_price);
        request.setAttribute("errors", errors);
        return new ModelAndView("/manager/schedule/UpdateSchedule");
    }


    @RequestMapping("/delschedshow")
    public ModelAndView delSchedShowPage(HttpServletRequest request){

        String pageNow = request.getParameter("pageNow");
        pageService.showScheduleByPage(request, pageNow);
        return new ModelAndView("/manager/schedule/DelScheduleShow");

    }

    @RequestMapping("/delsched")
    public ModelAndView delSchedPage(HttpServletRequest request){

        String[] checkbox = request.getParameterValues("type");
        if(checkbox != null) {
            for (int i = 0; i < checkbox.length; i++) {
                String id = checkbox[i];
                int sched_id = Integer.parseInt(id);
                scheduleService.deleteSchedule(sched_id);
            }
        }
        return delSchedShowPage(request);
    }

    @RequestMapping("/toaddschedule")
    public ModelAndView toAddSchedulePage(HttpServletRequest request){

        List<Studio> studio = studioService.selectStudio();
        List<Play> play = playService.selectPlay();
        request.setAttribute("studio", studio);
        request.setAttribute("play", play);

        return new ModelAndView("/manager/schedule/AddSchedule");

    }


    @RequestMapping("/editsched")
    public ModelAndView editSchedPage(HttpServletRequest request){

        String id = request.getParameter("id");
        int sched_id = Integer.parseInt(id);
        ScheduleDetail scheduleDetail = scheduleService.selectOneSchedule(sched_id);
        request.setAttribute("scheduleDetail", scheduleDetail);

        return new ModelAndView("/manager/schedule/UpdateSchedule");
    }
}
