package com.bsuir.rw.model.services;



import com.bsuir.rw.model.dao.UsersDao;
import com.bsuir.rw.model.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.utils.DateUtil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by USER on 12.04.2017.
 */
public class UserServices {

    private static final int MAX = 500;

    public UserServices(){
    }

    public  double generateBalance(){
        return Math.random() * MAX;
    }

    public boolean createUser(Users entity){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        dao.insert(entity);
        return true;
    }

   public Users getUserByLoginPassword(Users user){
       UsersDao dao = DAOFactory.getFactory().getUsersDao();
      Users entity=dao.findUser(user);
       return entity;
   }

    public List<Tickets> getCompletedTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(!ticket.getStatus().equals("возвращён")) {
                String s=ticket.getDateDeparture();
              Date docDate= DateUtil.converStringToDate(s);
                if(DateUtil.isPassed(docDate)){
                    result.add(ticket);
                }
            }

        }
        return result;
    }

    public List<Tickets> getFutureTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(!ticket.getStatus().equals("возвращён")) {
                String s=ticket.getDateDeparture();
                Date docDate= DateUtil.converStringToDate(s);
                if(!DateUtil.isPassed(docDate)){
                    result.add(ticket);
                }
            }

        }
        return result;
    }

    public List<Tickets> getCanceledTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(ticket.getStatus().equals("возвращён")) {
                result.add(ticket);
            }

        }
        return result;
    }




}
