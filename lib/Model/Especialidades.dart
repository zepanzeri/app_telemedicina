class Especialidade{
  late String id;
  late String descricao;

  Especialidade(this.id, this.descricao);

   Especialidade.fromJson(Map<String, dynamic> mapa, String id){
    this.id = id;
    this.descricao = mapa['descricao'];
  }
  
  Map<String,dynamic> toJson(){
    return {
      'id': this.id,
      'descricao': this.descricao   
    };
  }
}