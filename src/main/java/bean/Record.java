package bean;

import java.util.Date;

public class Record {
    private int id;
    private int uid;
    private int cid;
    private int rid;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", uid=" + uid +
                ", cid=" + cid +
                ", rid=" + rid +
                ", time=" + time +
                '}';
    }
}
