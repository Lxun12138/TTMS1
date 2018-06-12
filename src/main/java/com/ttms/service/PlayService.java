package com.ttms.service;

import com.ttms.entity.Play;

import javax.servlet.http.HttpServletRequest;
import java.util.List;



public interface PlayService {
    public void insertPlay(Play play);
    public void deletePlay(int play_id);
    public void updatePlay(Play play);

    public Play selectPlayByPlay_id(int play_id);
    public List<Play> selectPlay();
    public String addPlay(HttpServletRequest request);
    public String updatePlay(HttpServletRequest request);
}
