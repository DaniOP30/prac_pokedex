<template>
  <div>
    <div class="container justify-space-between">
      <v-row>
        <v-col cols="6">
          <div>
            <a href="/"><img src="img/web.png" alt=""></a>
          </div>
        </v-col>
      </v-row>
    </div>
    
    <v-divider></v-divider>
  <div class="searchDiv">
  <input placeholder="Buscar..." class="searchBar elevation-3" v-model="search" v-on:keyup.enter="searchData" />  
<v-btn class="button red darken-1 text-w is-rounded rounded-lg py-5 px-10" v-on:click="searchData" style="color: #fff;">
            Buscar
  </v-btn>
  </div>

    <div class="container">
      <v-row class="f-w">
        <div v-for="(data, index) in pokemons" :key="index">
          <v-col cols="12">
            <v-card class="carta" >
              <router-link :to="{name: 'Info_pokemon', params: {id:data.id}}">
                <v-img
                  class="pointer"
                  :src="data.img"
                  
                ></v-img>
              </router-link>
                <v-card-title class="justify-center">

                  {{data.name}}
                  
                </v-card-title>
                  
                <v-card-subtitle>
                  #{{data.id}}
                </v-card-subtitle>

                <v-card-actions >
                  <v-btn class="typebutton white--text" :style="{backgroundColor: changeColorType(data.type)}">
                    {{data.type}}
                  </v-btn>
                </v-card-actions>

            </v-card>
          </v-col>
        </div>
      </v-row>

    </div>
      
      <div>
        <nav class="pagination" role="navegation" aria-label="pagination">
       
            <v-btn class="px-6 elevation-2 red darken-1 ">
              <a class="pagination-previous" v-on:click="changePage(page-1)">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fff" class="bi bi-chevron-left " viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
              </svg>
              </a>
            </v-btn>
       
          
             
                <a class="pagination-link is-current numberpage font-weight-bold red--text text-h6">Página: {{page}}</a>
             
         
         <v-btn class="px-6 red darken-1 text">
              <a class="pagination-next" v-on:click="changePage(page+1)">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#fff" class="bi bi-chevron-right" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
              </a>
            </v-btn>
        
        </nav>
      </div>
  </div>
  
</template>

<script>
import axios from 'axios';
  export default {
    data(){
      return{
        pokemons: [],
        page: 1,
        pages: 1,
        search:''
      };
    },
    //cuando no hay nada visible
    created(){
      this.bApi();
    },
    //Cuando ya hay cosas visibles
    mounted(){
      
    },
    //funciones
    methods:{
      async bApi(){
        this.pokemons=[];
        let pag=150/20+1; 
        this.pages=Math.trunc(pag);
        
        console.log(this.pages);
        let instancia= this;
        let i =0;
        let b =0;
        
        if (this.page===1){
          i =1;
          b =20;
        }else if (this.page===2){
          i=21;
          b=40;
        }else if (this.page===3){
          i=41;
          b=60;
        }else if (this.page===4){
          i=61;
          b=80;
        }else if (this.page===5){
          i=81;
          b=100;
        }else if (this.page===6){
          i=101;
          b=120;
        }else if (this.page===7){
          i=121;
          b=140;
        }else if (this.page===8){
          i=141;
          b=150;
        }
        for ( i ; i <= b ; i++){
          
          await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`)
          
          .then((response)=>{
            let pokemon = {
                name: response.data.name,
                img: response.data.sprites.front_default,
                id:response.data.id,
                type:response.data.types[0].type.name
              };
            console.log("tipo");
            
            console.log(response.data.types.slot);
            instancia.pokemons.push(pokemon);
            
            })
          .catch(err =>{
            console.log(err);
            });
        }
        
          console.log(this.pokemons);
      },
      async viewBuscar(){
        this.pokemons=[];
        let instancia= this;
        let i=this.search;
        console.log(this.search);
        await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`)
          
          .then((response)=>{
            let pokemon = {
                name: response.data.name,
                img: response.data.sprites.front_default,
                id:response.data.id,
                type:response.data.types[0].type.name
              };
            
            
            instancia.pokemons.push(pokemon);
            
            })
          .catch(err =>{
            console.log(err);
            });
      },
      changePage(page){
        this.page= (page <= 0 || page > this.pages) ? this.page : page
        this.bApi();
        
      },
      searchData(){
        this.page = 1;
        if (this.search === ''){
          this.bApi();
        }else{
        this.viewBuscar()
        }
      },
      changeColorType(type){
        switch (type) {
          case 'grass': return '#03DE00';
          case 'fire': return '#F30D0D';
          case 'water': return '#0D80F3';
          case 'bug': return '#026E26';
          case 'normal': return '#F35D0D';
          case 'electric': return '#F3D30D';
          case 'poison': return '#A500DE';
          case 'fairy' : return '#00DEDB ';
          case 'ground': return '#AB4900 ';
          case 'fighting': return '#6B2D00';
          case 'rock ': return '#8E5328 ';
        }

      }
    }
  }
</script>

<style scoped>
  .logo{
    text-align: left;
    margin-top: 1%;
    margin-left: 1%;
    }
  .pointer{
    cursor: pointer;
    height:100%;
  
  }

 


  .searchDiv{
    display: flex;
    margin-top: 20px;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
    gap: 20px;
  }
  .searchBar{
     width: 40%;
      border: none;
      padding-top: 7px;
      padding-bottom: 7px;
      outline: 0;
      padding-left: 5px;
      border-radius: 5px;
      
    }

  .pagination{
      display: flex;
      justify-content: center;
      
      align-items: center;
      margin-top: 45px;
      padding-left: 20px;
      padding-right: 20px;
      padding-bottom: 20px;
    }

    .numberpage {
      margin-left: 40px ;
      margin-right: 40px;
    }
 

  .carta{
    width: 200px;
    max-width: 100%;
    text-align: center;

    } 
  .f-w{
    width: 100%;
    
    display: flex;
    justify-content: center;
  } 

  .titulo{
    text-align: center;
  }

  .typebutton{
    width: 100%;
  }
  
    
</style>