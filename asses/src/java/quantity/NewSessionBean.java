/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quantity;

import javax.ejb.Stateless;

/**
 *
 * @author varsha
 */
@Stateless
public class NewSessionBean {

    private int i;

    public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }
    public String calc(){
        if(i<5)
            return "Less quantity";
        else
            return "ok";
    }
}
