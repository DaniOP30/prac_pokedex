<template>
  <div>
    
    
    <div class="content">
       <v-card
        :loading="loading"
        class="mx-auto my-12"
        max-width="374"
        >
        <template slot="progress">
          <v-progress-linear
            color="deep-purple"
            height="10"
            indeterminate
          ></v-progress-linear>
        </template>

        <v-img
        
          height="100%"
          src="img/playerf.jpeg"
        >  <v-card-title style="color:  #eafaf1;" ><mark style="background-color:  #eafaf1 ;"> Daniel Olivo</mark></v-card-title>
        </v-img>

      
        <v-card-text>
          <v-row
            align="center"
            class="mx-0"
          >
            <div class="grey--text ms-4">
             Nivel 50 
            </div>
          </v-row>

          <div class="my-4 text-subtitle-1">
            <strong>Entrenador</strong> 
                  <div class="center">
                     <img height="100" src="img/zap.png">
                  </div>
          </div>
      
    

          <div>Sexo: Hombre</div>
          <div>Pokemones: 27</div>
          <div>Medallas: 12 </div>
          <div>Regiones: 3 </div>
          <div>Lugar natal: Pueblo paleta</div>
          <div>Mochila: 50/100</div>
          <div>Edad: 21 años</div>
          <div>Fecha de nacimiento: 00/00/1999</div>
          <div>Nacionalidad: Mexicano</div>

          <div class="my-4 text-subtitle-1">
            <strong>Contacto </strong> 
          </div>
          <div>Linkedin: </div>
          <div>Correo: </div>
          <div>Telefono: 755-102-0817</div>
          
        </v-card-text>

        <v-divider class="mx-4"></v-divider>

        <v-card-title>Medallas de gimnasio</v-card-title>

        <v-card-text>
          <div class="my-4 text-subtitle-1">
            <strong>Region Kanto </strong> 
          </div>
          <v-chip-group>
            <v-chip>Medalla roca</v-chip>

            <v-chip>Medalla Insecto</v-chip>

            <v-chip>Medalla Planta</v-chip>

            <v-chip>Medalla Electro</v-chip>
          </v-chip-group>
          <div class="my-4 text-subtitle-1">
            <strong>Region Yuno </strong> 
          </div>
          <v-chip-group>
            <v-chip>Medalla Fantasma</v-chip>

            <v-chip>Medalla Hielo</v-chip>

            <v-chip>Medalla Fuego</v-chip>

            <v-chip>Medalla Electro</v-chip>
          </v-chip-group>
          <div class="my-4 text-subtitle-1">
            <strong>Region Alola </strong> 
          </div>
          <v-chip-group>
            <v-chip>Medalla Agua</v-chip>

            <v-chip>Medalla Planta</v-chip>

            <v-chip>Medalla Lucha</v-chip>

            <v-chip>Medalla Metal</v-chip>
          </v-chip-group>
        </v-card-text>

        <v-card-actions>
          
        </v-card-actions>
      </v-card>

    </div>
  </div>
</template>

<script>
  export default {
    data(){
      return{
        x: "Valor de mi variable"
      }
    }
  }
</script>

<style scoped>
.center{
  text-align: center;
 
}

</style>