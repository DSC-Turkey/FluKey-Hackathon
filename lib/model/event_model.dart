import 'dart:convert';

List<EventDetail> eventDetailFromMap(String str) => List<EventDetail>.from(json.decode(str).map((x) => EventDetail.fromMap(x)));

String eventDetailToMap(List<EventDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class EventDetail {
    EventDetail({
        this.imageLink,
        this.title,
        this.comment,
        this.author,
        this.ticket,
        this.duration,
        this.date,
        this.longComment,
    });

    String imageLink;
    String title;
    String comment;
    String author;
    int ticket;
    String duration;
    String date;
    String longComment;

    factory EventDetail.fromMap(Map<String, dynamic> json) => EventDetail(
        imageLink: json['imageLink'],
        title: json['title'],
        comment: json['comment'],
        author: json['author'],
        ticket: json['ticket'],
        duration: json['duration'],
        date: json['date'],
        longComment: json['longComment'],
    );

    Map<String, dynamic> toMap() => {
        'imageLink': imageLink,
        'title': title,
        'comment': comment,
        'author': author,
        'ticket': ticket,
        'duration': duration,
        'date': date,
        'longComment': longComment,
    };
}
