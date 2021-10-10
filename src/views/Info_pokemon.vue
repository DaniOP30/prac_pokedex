<template>
    <div>
        <div class="container">
            <v-row>
                <v-col cols="2">
                    <v-img :src="pokemon.img"></v-img>
                    
                </v-col>
                <v-col cols="5">
                    <v-card>

                    </v-card>
                    <div class="container">
                        <v-row>
                            <v-col>
                                #{{pokemon.id}}
                            </v-col>
                            
                            
                        </v-row>
                        <v-row>
                            <v-col>
                                {{pokemon.name}}
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <v-btn>
                                    {{pokemon.type}}
                                </v-btn>
                                
                            </v-col>
                        </v-row>
                    </div>
                </v-col>
                <v-col cols="4"> 
                    
                </v-col>
            </v-row>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
  export default {
    data(){
      return{
        pokemon:''
      };
    },
    //cuando no hay nada visible
    created(){
      this.bApi();
    },
    //Cuando ya hay cosas visibles
    //funciones
    methods:{
      async bApi(){
        
        
          
        await axios.get(`https://pokeapi.co/api/v2/pokemon/9`)
        
        .then((response)=>{
         this.pokemon = {
            name: response.data.name,
            img: response.data.sprites.front_default,
            id:response.data.id,
            type:response.data.types[0].type.name
            };
        console.log("tipo");
        console.log(response.data.types.slot);
        
        
        })
        .catch(err =>{
        console.log(err);
        });
        
        
        console.log(this.pokemons);
      },
    }
  }
</script>



<style>

</style>