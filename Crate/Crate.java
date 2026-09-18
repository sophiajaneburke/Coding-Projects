// Sophia Burke

public class Crate {

    // data feilds
    private String crateLabel;   // like "[1]" ... "[20]" or " X "
    private String monster;      // "PIK", "CHA", "SQU", "BUL", "E", or "R"
    private int value;           // 100, 150, 120, 80, or 0

    // constructor
    public Crate(String crateLabel) {
        this.crateLabel = crateLabel;
        this.monster = "";
        this.value = 0;
    }

    // getters
    public String getCrateLabel() {
        return crateLabel;
    }

    public String getMonster() {
        return monster;
    }

    public int getValue() {
        return value;
    }

    // setters
    public void setCrateLabel(String crateLabel) {
        this.crateLabel = crateLabel;
    }

    public void setMonster(String monster) {
        this.monster = monster;
    }

    public void setValue(int value) {
        this.value = value;
    }

    // methods 
    public void makePik() {
        monster = "PIK";
        value = 100;
    }

    public void makeCha() {
        monster = "CHA";
        value = 150;
    }

    public void makeSqu() {
        monster = "SQU";
        value = 120;
    }

    public void makeBul() {
        monster = "BUL";
        value = 80;
    }

    public void makeEevee() {
        monster = "E";
        value = 0;
    }

    public void makeTeamR() {
        monster = "R";
        value = 0;
    }

    // mark this crate as already opened
    public void open() {
        crateLabel = " X ";
    }

    public String toString() {
        return "Crate[crateLabel=" + crateLabel
                + ", monster=" + monster
                + ", value=" + value + "]";
    }
}
