<template>
    <div>
        <div class="container">
            <v-row class="titulo">
                <v-col cols="12">
                    
                    <div class="til">
                        <p>
                            <router-link to="/">
                                <i>
                                    <svg xmlns="http://www.w3.org/2000/svg" class="backIcon" fill="#00000" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                                </svg>
                                </i>
                            </router-link>
                        </p>
                        {{pokemon.name}} <span class="subtitle rounded-circle">#{{pokemon.id}}</span>
                    </div> 
                </v-col>
            </v-row>
            <v-row class="contenido mt-10" >
                <v-col md="6" xs="12" style="height:100%">
                    
                    <v-img class="imagen" :src="pokemon.img"></v-img>
                </v-col>
                <v-col xs="12" md="6">
                    <div class="container2">
                        <v-row>
                            <v-col cols="12">
                                
                                <v-btn class="elevation-0 rounded-xl blue" style="width: 100%;">{{pokemon.type}}</v-btn>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-card class="px-5 py-5"  style="width: 100%; box-shadow: 0px 5px 20px #00000010; border-radius: 30px; margin-top: 10px;">
                                <v-col cols="12" >
                                <div style="padding-bottom: 25px;"> 
                                    <label >HP</label>
                                    <v-progress-linear :value="r_hp" height="20"  rounded></v-progress-linear>
                                </div>
                                <div style="padding-bottom: 25px;">
                                    <label >ATTACK</label>
                                    <v-progress-linear :value="r_attack" height="20"  rounded></v-progress-linear>
                                </div>
                                <div style="padding-bottom: 25px;">
                                    <label >DEFENSE</label>
                                    <v-progress-linear :value="r_defense" height="20"  rounded></v-progress-linear>
                                </div>
                                <div style="padding-bottom: 25px;">
                                    <label >ESPECIAL ATTACK</label>
                                    <v-progress-linear :value="r_especial_att" height="20"  rounded></v-progress-linear>
                                </div>
                                <div style="padding-bottom: 25px;">
                                    <label >ESPECIAL DEFENSE</label>
                                    <v-progress-linear :value="r_especial_def" height="20"  rounded></v-progress-linear>
                                </div>
                                <div style="padding-bottom: 25px;">
                                    <label >SPEED</label>
                                    <v-progress-linear :value="r_speed" height="20"  rounded></v-progress-linear>
                                </div>
                                
                                
                            </v-col>
                            </v-card>
                        </v-row>
                    </div>
                    
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
        pokemon:'',
        r_hp:'',
        r_attack:'',
        r_defense:'',
        r_especial_attack:'', 
        r_especial_defense:'',
        r_speedspeed:'', 
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
        
        
          const id = this.$route.params.id
        await axios.get(`https://pokeapi.co/api/v2/pokemon/${id}`)
        
        .then((response)=>{
         this.pokemon = {
            name: response.data.name,
            img: response.data.sprites.other.dream_world.front_default,
            id:response.data.id,
            type:response.data.types[0].type.name,
            hp:response.data.stats[0].base_stat,
            attack:response.data.stats[1].base_stat,
            defense:response.data.stats[2].base_stat,
            especialAttack:response.data.stats[3].base_stat,
            especialDefense:response.data.stats[4].base_stat,
            speed:response.data.stats[5].base_stat
            };
            
        console.log("stat");
        console.log(response.data.stats[0].base_stat);
        
        
        })
        .catch(err =>{
        console.log(err);
        });
        let mx_hp =100/ 250;
        let mx_attack=100/ 134;
        let mx_defense=100/ 180;
        let mx_especial_att=100/154;
        let mx_especial_def=100/124;
        let mx_speed=100/130;

        this.r_hp =this.pokemon.hp * mx_hp;
        this.r_attack=this.pokemon.attack * mx_attack;
        this.r_defense=this.pokemon.defense * mx_defense;
        this.r_especial_att=this.pokemon.especialAttack * mx_especial_att;
        this.r_especial_def=this.pokemon.especialDefense * mx_especial_def;
        this.r_speed=this.pokemon.speed * mx_speed; 
        
        console.log(this.pokemon);
        
        
      },
    }
  }
</script>



<style>
*{
    font-family: 'Poppins', sans-serif;
}
    .titulo{
        
        font-weight: 600;
        font-size: 200%;    
    }
    .til{
        text-transform: uppercase;
        display: flex;
        justify-content: space-between;
    }

    @media (min-width: 480px) {
       .til{
        justify-content: start;
        gap: 25px;
        
       }

       .titulo{
    font-size: 400%;
       }

       .til .backIcon{
        margin-right: 25px;
        height: 60px;
        width: 60px;
       }


       
    }

    .til i{
        color: #000;
    }
    .til .backIcon{
        margin-right: 10px;
        height: 50px;
        width: 50px;    
    }
    .subtitle{
        
     opacity: 0.4;   
       
    }
    .imagen{
        height: 100%;
        width: 400px;
    }
    .contenido{
        margin-top: 200px;
    }
</style>