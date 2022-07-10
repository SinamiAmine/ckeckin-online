
class Room {
   int? id;
   String? mineur;
   String? sexe;
   String? nom;
   String? prenom;
   String? adresse;
   String? datnaiss;
   String? lieunaiss;
   String? natio;
   String? nationalit;
   String? ville;
   String? catprof;
   String? motifvoy;
   String? natdoc;
  // String? typdoc;
   String? numdoc;
  // String? cdprof;
   //String? gst_img;
   //String? front_remove;
   //String? back_remove;
  // String? nchambre;
   //String? nper;
   //String? nbrper;
  // String? nlgn;
   //String? nlgn2;
   String? pos;
   //String? typech;

   Room({
    this.id,this.mineur,this.sexe,this.nom,this.prenom,this.adresse,this.datnaiss,this.lieunaiss,this.natio,this.nationalit,this.ville,
    this.catprof,this.motifvoy,this.natdoc,this.numdoc,
    this.pos

  });

  factory Room.fromJson(Map<String?, dynamic> json) {
    return Room(
        mineur: json["mineur"],
        sexe: json["sexe"],
        nom: json["nom"],
        prenom: json["prenom"],
        adresse: json["adresse"],
        datnaiss: json["datnaiss"],
        lieunaiss: json["lieunaiss"],
        natio: json["natio"],
        nationalit: json["nationalit"],
        ville: json["ville"],
        catprof: json["catprof"],
        motifvoy: json["motifvoy"],
        natdoc: json["natdoc"],
        numdoc: json["numdoc"],
        pos: json["pos"],

    );
  }
}
