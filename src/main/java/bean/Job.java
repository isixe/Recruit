package bean;

import java.util.Date;

public class Job {
    private int company_id;
    private int position_id;
    private int technology_id;
    private String area;
    private double salary;
    private String require;
    private Date time;

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getTechnology_id() {
        return technology_id;
    }

    public void setTechnology_id(int technology_id) {
        this.technology_id = technology_id;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Job{" +
                "company_id=" + company_id +
                ", position_id=" + position_id +
                ", technology_id=" + technology_id +
                ", area='" + area + '\'' +
                ", salary=" + salary +
                ", require='" + require + '\'' +
                ", time=" + time +
                '}';
    }
}
