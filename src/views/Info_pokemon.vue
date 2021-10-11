<template>
    <div>
        <div class="container">
            <v-row class="titulo">
                <v-col md="12">
                    <div class="til">{{pokemon.name}} <span class="subtitle">#{{pokemon.id}}</span></div> 
                </v-col>
            </v-row>
            <v-row class="contenido">
                <v-col cols="6" style="height:100%">
                    <v-img class="imagen" :src="pokemon.img"></v-img>
                </v-col>
                <v-col cols="6">
                    <div class="container2">
                        <v-row>
                            <v-col cols="12">
                                <v-btn>{{pokemon.type}}</v-btn>
                            </v-col>
                        </v-row>
                        <v-row>
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
        
        
          
        await axios.get(`https://pokeapi.co/api/v2/pokemon/9`)
        
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
    .titulo{
        
        text-align: left;
        font-size: 400%;
    }
    .til{
        text-transform: uppercase;
    }
    .subtitle{
        opacity: 0.3;
    }
    .imagen{
        height: 100%;
        width: 400px;
    }
    .contenido{
        margin-top: 200px;
    }
</style>