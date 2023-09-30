package com.example.coursemanagement.model;

public class CourseDetailedContent {
    private int id;
    private String title;
    private String content;
    private String idVideo;
    private int courseContentId;
    private int courseContentTypeId;

    public CourseDetailedContent(String title, String content, String idVideo, int courseContentId, int courseContentTypeId) {
        this.title = title;
        this.content = content;
        this.idVideo = idVideo;
        this.courseContentId = courseContentId;
        this.courseContentTypeId = courseContentTypeId;
    }

    public CourseDetailedContent(int id, String title, String content, String idVideo, int courseContentId, int courseContentTypeId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.idVideo = idVideo;
        this.courseContentId = courseContentId;
        this.courseContentTypeId = courseContentTypeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIdVideo() {
        return idVideo;
    }

    public void setIdVideo(String idVideo) {
        this.idVideo = idVideo;
    }

    public int getCourseContentId() {
        return courseContentId;
    }

    public void setCourseContentId(int courseContentId) {
        this.courseContentId = courseContentId;
    }

    public int getCourseContentTypeId() {
        return courseContentTypeId;
    }

    public void setCourseContentTypeId(int courseContentTypeId) {
        this.courseContentTypeId = courseContentTypeId;
    }

    @Override
    public String toString() {
        return "CourseDetailedContent{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", idVideo='" + idVideo + '\'' +
                ", courseContentId=" + courseContentId +
                ", courseContentTypeId=" + courseContentTypeId +
                '}';
    }
}
