

import 'Room.dart';

class Reservation {
  final int? id;
  final int? numresa ;
  final int? datearr ;
  final int? datedep ;
  final int? img_count;
  final List<Room>? rooms;

  const Reservation({this.id,this.numresa,this.datearr,this.datedep,this.img_count,this.rooms});

  factory Reservation.fromJson(Map<String?, dynamic> json) {
    return Reservation(
        id: json["mineur"],
        numresa: json["sexe"],
        datedep: json["nom"],
        datearr: json["prenom"],
        img_count: json["adresse"],
        rooms: json["rooms"],

    );
  }
}

