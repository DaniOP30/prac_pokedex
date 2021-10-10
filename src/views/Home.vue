<template>
  <div>
    <div class="logo">
      <img src="img/web.png" alt="">
    </div>
    <div class="container">
        <v-row class="f-w">
          <div v-for="(data, index) in pokemons" :key="index">
          <v-col >
            <v-card class="carta">
              <v-img
                class="pointer"
                :src="data.img"
                
              ></v-img>
          
              <v-card-title>
                {{data.name}}
              </v-card-title>
                
              <v-card-subtitle>
                #{{data.id}}
              </v-card-subtitle>
          
              
            </v-card>
          </v-col>
          </div>
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
        
      };
    },
    //cuando no hay nada visible
    async created(){
      let instancia= this;
      for (let i = 1; i <= 20 ; i++){
        console.log(i);
        console.log("espacio");
        await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`)
        
        .then((response)=>{
          let pokemon = {
              name: response.data.name,
              img: response.data.sprites.front_default,
              id:response.data.id
            };
          
          
          instancia.pokemons.push(pokemon);
          console.log(response.data.id);
          })
        .catch(err =>{
          console.log(err);
          });
      }
      
        console.log(this.pokemons);
    },
    //Cuando ya hay cosas visibles
    mounted(){
      this.miMetodo2();
    },
    methods:{
      miMetodo(){
        console.log("mi metodo texto");
      },
      miMetodo2(){
        console.log("mi metodo 2");
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
    
    
    } 
  .f-w{
    width: 100%;
    
    display: flex;
    justify-content: center;
  } 
    
</style>