class RpgController < ApplicationController
  

  def index  
  	if !session[:coins]
  		session[:coins] = 0
  	end
  	if !session[:activities]
  		session[:activities] = []
  	end
  end

  def farm
  	rand = rand(10..20)
  	session[:coins] += rand
  	session[:activities].unshift({:message => "You earned #{rand} coins from the farm at #{Time.now.strftime("%m/%d/%Y %l:%M %p")}", :color => "greenText"})
  	redirect_to "/rpg/index"
  end

  def cave
  	rand = rand(5..10)
  	session[:coins] += rand
  	session[:activities].unshift({:message => "You earned #{rand} coins from the cave at #{Time.now.strftime("%m/%d/%Y %l:%M %p")}", :color => "greenText"})
  	redirect_to "/rpg/index"
  end
  
  def house
  	rand = rand(2..5)
  	session[:coins] += rand
  	session[:activities].unshift({:message => "You earned #{rand} coins from the house at #{Time.now.strftime("%m/%d/%Y %l:%M %p")}", :color => "greenText"})
  	redirect_to "/rpg/index"
  end

  def casino
  	casgivetake = rand(0..1)
  	rand = rand(0..50)
  	if casgivetake == 0
  		session[:coins] -= rand
  		session[:activities].unshift({:message => "You entered a casino and lost #{rand} coins...  Ouch!!! #{Time.now.strftime("%m/%d/%Y %l:%M %p")}", :color => "redText"})
  	else
  		session[:coins] += rand
  		session[:activities].unshift({:message => "You earned #{rand} coins from the casino at #{Time.now.strftime("%m/%d/%Y %l:%M %p")}", :color => "greenText"})
  	end
  	redirect_to "/rpg/index"  	
  end

  def new
  	session.clear
  	redirect_to "/rpg/index"  	  	  	
  end
end
