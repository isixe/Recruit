package bean;

import java.util.Date;

public class Job {
    private int id;
    private int company_id;
    private int position_id;
    private String area;
    private String time; //工作类型 （全职/兼职）
    private String contact;
    private int maxsalary;
    private int minsalary;
    private String job_requirements;
    private String job_require;
    private String welfare;
    private String title;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getMaxsalary() {
        return maxsalary;
    }

    public void setMaxsalary(int maxsalary) {
        this.maxsalary = maxsalary;
    }

    public int getMinsalary() {
        return minsalary;
    }

    public void setMinsalary(int minsalary) {
        this.minsalary = minsalary;
    }

    public String getJob_requirements() {
        return job_requirements;
    }

    public void setJob_requirements(String job_requirements) {
        this.job_requirements = job_requirements;
    }

    public String getJob_require() {
        return job_require;
    }

    public void setJob_require(String job_require) {
        this.job_require = job_require;
    }

    public String getWelfare() {
        return welfare;
    }

    public void setWelfare(String welfare) {
        this.welfare = welfare;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", company_id=" + company_id +
                ", position_id=" + position_id +
                ", area='" + area + '\'' +
                ", time='" + time + '\'' +
                ", contact='" + contact + '\'' +
                ", maxsalary=" + maxsalary +
                ", minsalary=" + minsalary +
                ", job_requirements='" + job_requirements + '\'' +
                ", job_require='" + job_require + '\'' +
                ", welfare='" + welfare + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
