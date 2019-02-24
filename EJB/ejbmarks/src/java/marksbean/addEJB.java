
package marksbean;

import javax.ejb.Stateless;

/**
 *
 * @author varsha
 */
@Stateless
public class addEJB {

    private int i,j,k,l;

    public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }

    public int getJ() {
        return j;
    }

    public void setJ(int j) {
        this.j = j;
    }

    public int getK() {
        return k;
    }

    public void setK(int k) {
        this.k = k;
    }

    public int getL() {
        return l;
    }

    public void setL(int l) {
        this.l = l;
    }
    public void add(){
        l=i+j+k;
    }
    public String calc()
    {
        if( i>35 && j >35 && k > 35) return "pass";
        else return "fail";
    }
}
