<template>
  <div>
    <div class="container justify-space-between">
      <v-row>
        <v-col cols="6">
          <div>
            <img src="img/web.png" alt="">
          </div>
        </v-col>
        <v-col cols="3">
          <v-text-field v-model="search" v-on:keyup.enter="searchData"></v-text-field>  
          
        </v-col>
        <v-col cols="3">
          <v-btn class="button success is-rounded" v-on:click="searchData">
            Buscar
          </v-btn>
        </v-col>
      </v-row>
    </div>
    
    <v-divider></v-divider>

    <div class="container">
      <v-row class="f-w">
        <div v-for="(data, index) in pokemons" :key="index">
          <v-col >
            <v-card class="carta">
              <v-img
                class="pointer"
                :src="data.img"
                
              ></v-img>
              
                <v-card-title class="justify-center">

                  {{data.name}}
                  
                </v-card-title>
                  
                <v-card-subtitle>
                  #{{data.id}}
                </v-card-subtitle>

                <v-card-actions>
                  <v-btn>
                    {{data.type}}
                  </v-btn>
                </v-card-actions>

            </v-card>
          </v-col>
        </div>
      </v-row>
      <v-row>
        <nav class="pagination" role="navegation" aria-label="pagination">
          <v-col>
            <v-btn >
              <a class="pagination-previous" v-on:click="changePage(page-1)">Anterior</a>
            </v-btn>
          </v-col>
          <v-col>
            <ul>
              <li>
                <a class="pagination-link is-current">{{page}}</a>
              </li>
            </ul>
          </v-col>
          <v-col>
            <v-btn >
              <a class="pagination-next" v-on:click="changePage(page+1)">Siguiente</a>
            </v-btn>
          </v-col>
        </nav>
      </v-row>
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
                type:response.data.types
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
                id:response.data.id
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
  
 
  .carta{
    width: 300px;
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
  
    
</style>