<template>
  <!-- Navbar -->
  <div>
    <div class="container justify-space-between">
      <v-row>
        <v-col cols="9">
          <div>
            <a href="/" ><img src="img/web.png" alt=""></a>
          </div>
        </v-col>
        <v-col cols="3" class="avatar">
          <a @click.stop="drawer = !drawer">
            <v-list-item-avatar>
              <v-img src="img/playerf.jpeg"></v-img>
            </v-list-item-avatar>
          </a>
          <v-navigation-drawer style="width: 400px"
            v-model="drawer"
            absolute
            temporary
            right
          >
          <!-- Sidebar con datos personales -->
            <v-list-item>
              <v-list-item-avatar size="100">
                <v-img src="img/playerf.jpeg" ></v-img>
              </v-list-item-avatar>
      
              <v-list-item-content>
                <v-list-item-title><h2>Daniel Olivo</h2> </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
      
            <v-divider></v-divider>

            <v-list dense>
              <v-list-item>
                
      
                <v-list-item-content>
                  <v-list-item><b>Edad: 22 años</b> </v-list-item>
                  <v-list-item><h4>Fecha de nacimiento: 30/12/98</h4></v-list-item>
                  <v-list-item><h2><b>Contacto:</b> </h2></v-list-item>
                  <v-list-item><h4>www.linkedin.com/in/carlos-daniel-olivo-pérez-70b99a222 </h4>  </v-list-item>
                  <v-list-item><h4>daniel.olivo.p98@gmail.com</h4></v-list-item>
                  <v-list-item><h4>7551020817</h4></v-list-item>
                </v-list-item-content>
                
                
              </v-list-item>
            </v-list>
          </v-navigation-drawer>
          
        </v-col>
      </v-row>
    </div>
  
    <v-divider></v-divider>
    <!-- Barra de busqueda -->
  <div class="searchDiv">
  <input placeholder="Buscar por número/nombre completo" class="searchBar" v-model="search" v-on:keyup.enter="searchData" />  <i><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></i>

  </div>
    <!-- Contenido principal -->
    <div class="container">
      <v-row class="f-w d-flex">
        <div v-for="(data, index) in pokemons" :key="index">
          <v-col cols="12">
            <v-card class="carta rounded-lg px-5 py-3" style="box-shadow: 0px 5px 20px #7777770F; border: 1px solid #F7F7F7; ">
              <router-link :to="{name: 'Info_pokemon', params: {id:data.id}}">
              <v-img
                class="pointer"
                :src="data.img"></v-img>
              </router-link>
                <v-card-title class="justify-center font-weight-black text-capitalize">

                  {{data.name}}
                  
                </v-card-title>
                  
                <v-card-subtitle>
                  #{{data.id}}
                </v-card-subtitle>

                <v-card-actions >
                  <v-btn class="typebutton white--text rounded-lg elevation-0" :style="{backgroundColor: changeColorType(data.type)}">
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

// Petición de axios para consumo de PokéAPI
<script>
import axios from 'axios';
  export default {
    data(){
      return{
        drawer:null,
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

        // Métodos de padinado
        // Ubica el índice de la páginas
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
        // Muestra 20 pokemones
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
            
            
            instancia.pokemons.push(pokemon);
            
            })
          .catch(err =>{
            console.log(err);
            });
        }
        
          console.log(this.pokemons);
      },
      // Función para buscar en la barra de búsqueda
      async viewBuscar(){
        this.pokemons=[];
        let instancia= this;
        let i=this.search;
        let j=i.toLowerCase();
        console.log(j);
        await axios.get(`https://pokeapi.co/api/v2/pokemon/${j}`)
          
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
      // Función de paginación
      changePage(page){
        this.page= (page <= 0 || page > this.pages) ? this.page : page
        this.bApi();
        
      },
      // función de búsqueda
      searchData(){
        this.page = 1;
        if (this.search === ''){
          this.bApi();
        }else{
        this.viewBuscar()
        }
      },
      // Cambio de color según el tipo
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
    margin: 10px 5px 10px 20px;
    padding: 5px 4px 5px 4px;
  }

  /* Medida en celulares */
  @media (min-width: 480px) {
    .searchDiv{
      justify-content: end;
       position:relative;
        
     }

     .searchBar{
       max-width: 35%;
       box-shadow: 0px 1px 10px #0000000B;
      border-radius: 25px;
      outline: 0;
      
      margin-right: 60px;
      padding-left: 45px;
     }

     
  }
  
  /* Medidas en iPads / Tablet */
  @media (min-width: 768px) {
     .searchBar{
       max-width: 100%;

     }

     .searchDiv{
       padding-left: 70px;
       padding-right: 70px;
     }

     
  }

  /* Medidas de escritorio */
  @media (min-width: 1140px) {
     

     .searchBar{
       max-width: 35%;
     }
  }

  .searchDiv i{
    position: absolute;
    right: 85.5%;
    
    top: 124px;
    color:#707070;
    opacity: 0.42;
  }
  .searchBar{
      background: #F7F7F7 0% 0% no-repeat padding-box;
      width: 100%;
      padding-top: 10px;
      padding-bottom: 10px;
      padding-left:40px ;
      border-radius: 25px;
      outline: none;
    }
  
  /* Medida para iPads */
    @media (min-width: 481px) and (max-width: 767px) {
  
  .searchDiv{
    justify-content: center;
    
  }

  
  
}

    .searchBar::placeholder{
      color: #707070;
       opacity: 0.42;
       
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
    width: 250px;
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
  .avatar{
   display: flex;
   padding-left: 35px;
   align-items: center;
    justify-content: end;
  }
    
</style>