class Agendamento{
  late String idPaciente;
  late String especialidade;
  late String data;
  Agendamento(this.idPaciente, this.especialidade, this.data);

   Agendamento.fromJson(Map<String, dynamic> mapa, String id){
    this.idPaciente = id;
    this.especialidade= mapa['especialidade'];
    this.data = mapa['data'];
  }
  
  //Converter um OBJETO em um DOCUMENTO
  Map<String,dynamic> toJson(){
    return {
      'id'    : this.idPaciente,
      'email' : this.especialidade,
      'nome'  : this.data,
    };
  }
}