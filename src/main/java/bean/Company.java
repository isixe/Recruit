package bean;

import java.util.Date;

public class Company {
    private String name;
    private String area;
    private Date buildTime;
    private String contact;
    private String desc;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(Date buildTime) {
        this.buildTime = buildTime;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "Company{" +
                "name='" + name + '\'' +
                ", area='" + area + '\'' +
                ", buildTime=" + buildTime +
                ", contact='" + contact + '\'' +
                ", desc='" + desc + '\'' +
                '}';
    }
}
