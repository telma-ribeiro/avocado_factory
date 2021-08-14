#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "sinf_interfaces.h"


#define BLUE "[0,0,254]"
#define GREEN "[0,254,0]"
#define RED "[254,0,0]"
#define BLACK "[0,0,0]"
#define GREEN_CONSUMO "[0,153,0]"
#define ATUADOR_SEMENTE "[0,102,204]"
#define ATUADOR_TERRA "[0,102,204]"
#define ATUADOR_RESERVATORIO "[0,102,204]"
#define ATUADOR_LUZ "[0,102,204]"
#define ATUADOR_AGUA "[0,102,204]"
#define WHITE "[254,254,254]"
#define FLOOR2 "[192,192,192]"
#define FLOOR1 "[204,255,255]"
#define FLOOR3 "[204,255,204]"
#define FLOOR "[255,153,204]"
#define FLOOR5 "[204,153,255]"
#define TERRA "[153,51,0]"
#define SENSOR_TERRA "[51,51,153]"
#define TERRA_MOLHADA "[128,0,0]"
#define AGUA "[0,204,255]"
#define SENSOR_RESERVATORIO "[51,51,153]"
#define SENSOR_AGUA "[51,51,153]"
#define ABACATE "[51,51,0]"
#define ARVORE "[0,128,0]"
#define SEMENTE "[255,153,0]"
#define SENSOR_SEMENTE "[51,51,153]"
#define LUZ_FORTE "[255,204,0]"
#define LUZ_FRACA "[255,255,0]"
#define MAX_MSG_SIZE 75

const char *channelRGB = "/tmp/ttyV10";
const char *channelMSGCreator = "/tmp/ttyV12";
const char *channelMSGCreator2 = "/tmp/ttyV14";
const char *channelMSGCreator3 = "/tmp/ttyV16";
const char *channelMSGCreator4 = "/tmp/ttyV18";
const char *channelMSGCreator5 = "/tmp/ttyV20";

char received_data[MAX_MSG_SIZE];
char *token;

FILE *sensor_data_channel;
FILE *sensor_data_channel2;
FILE *sensor_data_channel3;
FILE *sensor_data_channel4;
FILE *sensor_data_channel5;
FILE *matrix_channel;

float temp=0, hum=0, light=0, terra_agua=0, curr=0, reserva=0, seed_extra=0;
float  prev_value_terra_agua, prev_value_hum, prev_value_temp, prev_value_reserva, prev_value_rega;



float check_seed_extra(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  float seed_extra_data;
  
  strcpy(char_data,"");

  sensor_data_channel5 = fopen(channelMSGCreator5, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel5) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  // seed  - tokens 16 and 17
  strcat(char_data, data[16]);
  strcat(char_data, data[17]);
  seed_extra_data = strtol(char_data,NULL,16);
  
    
  float seed_extra = -39.6 + 0.01 * seed_extra_data;
    
  printf("seed_extra=%f \t", seed_extra);
 
  fclose(sensor_data_channel5);
  
  return seed_extra; 	
}


float check_reserva(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  float ag_reserva;
  
  strcpy(char_data,"");

  sensor_data_channel4 = fopen(channelMSGCreator4, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel4) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  // reservatorio - tokens 12 and 13
  strcat(char_data, data[12]);
  strcat(char_data, data[13]);
  ag_reserva= strtol(char_data,NULL,16);
    
  float reserva = 625000 * (ag_reserva/4096)*0.015;  
    
  printf("Reserva=%f \t", reserva);
  
    
  fclose(sensor_data_channel4);
  
  
  return reserva;	
}


float check_agua_terra(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  float ag_terra_data;
  
  strcpy(char_data,"");

  sensor_data_channel2 = fopen(channelMSGCreator2, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel2) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  // agua_terra - tokens 12 and 13
  strcat(char_data, data[12]);
  strcat(char_data, data[13]);
  ag_terra_data = strtol(char_data,NULL,16);
    
  float terra_agua = 625000 * (ag_terra_data/4096)*0.015;  
    
  printf("terra_agua=%f \t", terra_agua);
  
    
  fclose(sensor_data_channel2);
  
  
  return terra_agua;	
}

float check_sensor_1(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  int32_t temp_data;
  
  strcpy(char_data,"");

  sensor_data_channel = fopen(channelMSGCreator, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  
  // Temperature  - tokens 16 and 17
  strcat(char_data, data[16]);
  strcat(char_data, data[17]);
  temp_data = strtol(char_data,NULL,16);
    
  float temp = -39.6 + 0.01 * temp_data;

  printf("temp=%f \t", temp);
    
  fclose(sensor_data_channel);
 
  return temp;	
}

float check_sensor_2(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  float light_data;
  
  strcpy(char_data,"");

  sensor_data_channel = fopen(channelMSGCreator, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  
  // Light - tokens 12 and 13
  strcat(char_data, data[12]);
  strcat(char_data, data[13]);
  light_data = strtol(char_data,NULL,16);
    
  float light = 625000 * (light_data/4096)*0.015;

 
  printf("light=%f \t",light);
 
    
  fclose(sensor_data_channel);
  
  return light;	
}
float check_sensor_3(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  int32_t humidity_data;
  
  strcpy(char_data,"");

  sensor_data_channel3 = fopen(channelMSGCreator3, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel3) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  

  // Humidity - tokens 18 and 19
  strcat(char_data, data[18]);
  strcat(char_data, data[19]);
  humidity_data = strtol(char_data,NULL,16);
    
  float hum = -0.50468+0.0367*humidity_data-0.0000015955*humidity_data*humidity_data;	// com a formula que era dada os valores estavam muito desfazados..
    
  printf("hum=%f \t", hum);
  
  fclose(sensor_data_channel3);
 
  
  return hum;	
}

float check_curr(){
	
  char *data[100], char_data[10]; 
  int i = 0;
  float curr_data;
  
  strcpy(char_data,"");

  sensor_data_channel3 = fopen(channelMSGCreator3, "r");
  
  if (fgets(received_data,MAX_MSG_SIZE,sensor_data_channel3) != NULL){
    token = strtok(received_data," ");    
  }
  
  while (token != NULL){	
	data[i++] = token;
	token = strtok(NULL," ");	  
  }
  
  

  // Humidity - tokens 14 and 15
  strcat(char_data, data[14]);
  strcat(char_data, data[15]);
  curr_data = strtol(char_data,NULL,16);
    
  float curr = 769*(curr_data/4096)*1.5;	// com a formula que era dada os valores estavam muito desfazados..
    
  printf("curr=%f   \n", curr);
 
  fclose(sensor_data_channel3);
  
  return curr;	
}

void writeRGBmatrix(float value_temp,float value_light,float value_hum,float value_terra_agua, float value_curr, float value_reserva, float value_seed_extra){

	// show_.. it's a sensor indicator on the matrix 
	// act1_.. it's an actuator (indicator) on the matrix 	
  
  char show_seed[20], act1_seed[20];
  char show_terra[20], act1_terra[20], act2_terra[20], act3_terra[20];
  char show_agua[20], act1_agua[20], act2_agua[20], act3_agua[20];
  char show_temp[20], act1_temp[20];
  char show_light[20], act1_light[20],act2_light[20];
  char show_hum[20], show2_hum[20],show3_hum[20], act1_hum[20];
  char show_abacate[20];
  char act1_curr[20];
  
  int troca=0;
  
   FILE *f, *fconf;
    char first_line[256], first_line_2[256], line_secondcell[256],line_third[256];
    int  count=0, c=0;
    int valor1=0, valor2=0, valor3=0, valoragua1=0, valoragua2=0, valoragua3=3;
    char *token, *token1;
    const char a[20]="' '";

	
  

  
   FILE *Fmsg;
  
	char file[100];
	char cond[256];
	
  strcpy(show_seed,"");
  strcpy(act1_seed,"");
  strcpy(show_terra,"");
  strcpy(act1_terra,"");
  strcpy(act2_terra,"");
  strcpy(act3_terra,"");
  strcpy(show_agua,"");
  strcpy(act1_agua,"");
  strcpy(act2_agua,"");
  strcpy(act3_agua,"");
  
  
  strcpy(show_temp,"");
  strcpy(act1_temp,"");
  strcpy(show_light,"");
  strcpy(act1_light,"");
  strcpy(act2_light,"");
  strcpy(show_hum,"");
  strcpy(show2_hum,"");
  strcpy(show3_hum,"");
  strcpy(act1_hum,"");
  strcpy(show_abacate,"");
  
  strcpy(act1_curr,"");
  
  
  
  ////////////////////////////////////////////////
  
  FILE *fseed;
  
  
  
    char  first_line_3[256], *token2;
    int ativarcelula=0;
    
    


    if((fseed=fopen("Sensor_Configuration.txt", "r"))==NULL){
        exit(1);
    }



    if(fgets(first_line_3, 256, fseed)){
        token2=strtok(first_line_3, a);

    }

        token2=strtok(NULL, a);
        //printf("token que queremos comparar %s \n", token2);
        if(strcmp("TEMP5:", token2)==0){ //ainda nao trocamos os sensores da terra e reservatorio
              //printf("A linha tem alguma coisa escrita \n");
             ativarcelula=1;
             fclose(fseed);
    
        }
        else {
            // printf("a linha esta vazia %d \n", strcmp("TERRA5:", token2));
             ativarcelula=0;
          fclose(fseed);

        }
        printf("%d \n", ativarcelula);
        
        //////////////////////////////////7
  
  
  matrix_channel = fopen(channelRGB, "w");
  
  

    if((fconf=fopen("Sensor_Configuration.txt", "r"))==NULL){
        //printf("O ficheiro Sensor_configuration não existe \n");
        exit(1);
    }
    else{
        //printf("O ficheiro foi aberto \n");
    }

fgets(first_line_2, 256, fconf);
    

        
          //RGB-seed 
          
    
    if(ativarcelula==1){ 
		if (value_seed_extra > 15){			//droop seed
		
			strcpy(show_seed,GREEN);
			strcpy(act1_seed,SEMENTE);
		}
  
		else{							//wait
			strcpy(show_seed,RED);
			strcpy(act1_seed,FLOOR1);
		}
	
	}
	
  
   ///////////////////////////
  

    if(fgets(line_secondcell,256,fconf)!=NULL){
        token=strtok(line_secondcell, a);
    
    }
  
        token=strtok(NULL, a);
       // printf("token que queremos comparar %s \n", token);
        if(strcmp("TERRA5:", token)==0){ 										//ainda nao trocamos os sensores da terra e reservatorio
			
			
            //printf("Resultado do strcmp %d \n", strcmp("TERRA5:", token));
            
            fclose(fconf);
           

            if((f=fopen("Sensor_Rules.txt", "r"))==NULL){
                //printf("O ficheiro Sensor_rules não existe \n");
                 exit(1);
            }
        

            fgets(first_line, 256, f);
  
            if(fgets(line_secondcell, 256, f)!=NULL){
                token=strtok(line_secondcell, a);
                //printf("Token da segunda linha: \n");
            }
        
        while(token!=NULL){

        token=strtok(NULL,a);
        count++;
        if(count==2){
            valor1=atoi(strtok(NULL,a));
            //printf("Valor 1: %d \n", valor1);
        }
        if(count==6){
            valor2=atoi(strtok(NULL,a));
            //printf("Valor 2: %d \n", valor2);
        }
        if(count==10){
            valor3=atoi(strtok(NULL,a));
            //printf("Valor 3: %d \n", valor3);
        }
    }
       if(fgets(line_third, 256, f)!=NULL){
                token1=strtok(line_third, a);
               // printf("Token da terceira linha: %s \n", token1 );
            }
             
        while(token1!=NULL){

        token1=strtok(NULL,a);
        c++;
        if(c==2){
            valoragua1=atoi(strtok(NULL,a));
            //printf("Valor 1 (agua): %d \n", valoragua1);
        }
        if(c==6){
            valoragua2=atoi(strtok(NULL,a));
           // printf("Valor 2 (agua): %d \n", valoragua2);
        }
        if(c==10){
            valoragua3=atoi(strtok(NULL,a));
            //printf("Valor 3 (agua): %d \n", valoragua3);
        }
    }
count=0;
c=0;


        }

    else if((strcmp("AGUA2:", token)==0)){ //os sensores da terra e reservatorio estao trocados
		
		troca=1;
		
          fclose(fconf);
          

            if((f=fopen("Sensor_Rules.txt", "r"))==NULL){
                //printf("O ficheiro Sensor_rules não existe \n");
                 exit(1);
            }
           

            fgets(first_line, 256, f);
           // printf("Ja leu a primeira linha \n");
            
            if(fgets(line_secondcell, 256, f)!=NULL){
                token=strtok(line_secondcell, a);
                //printf("Token da segunda linha: \n");
            }
        
        while(token!=NULL){

        token=strtok(NULL,a);
        count++;
        if(count==2){
            valoragua1=atoi(strtok(NULL,a));
          //  printf("Valor da agua 1: %d \n", valoragua1);
        }
        if(count==6){
            valoragua2=atoi(strtok(NULL,a));
           // printf("Valor da agua 2: %d \n", valoragua2);
        }
        if(count==10){
            valoragua3=atoi(strtok(NULL,a));
           // printf("Valor da agua3: %d \n", valoragua3);
        }
    }
 

            if(fgets(line_third, 256, f)!=NULL){
                token1=strtok(line_third, a);
             //   printf("Token da terceira linha: %s \n", token1 );
            }
             
        while(token1!=NULL){

        token1=strtok(NULL,a);
        c++;
        if(c==2){
            valor1=atoi(strtok(NULL,a));
           // printf("Valor 1 (terra): %d \n", valor1);
        }
        if(c==6){
            valor2=atoi(strtok(NULL,a));
           // printf("Valor 2 (terra): %d \n", valor2);
        }
        if(c==10){
            valor3=atoi(strtok(NULL,a));
          //  printf("Valor 3 (terra): %d \n", valor3);
        }
    }
count=0;
c=0;

    }
    
   fclose(f);
 
     
     
   if (troca==0){
	  
	   
		if (prev_value_terra_agua > value_terra_agua){			//wait (decrescente)
		
    strcpy(show_terra,GREEN);
    strcpy(act1_terra,TERRA);
    strcpy(act2_terra,TERRA);
    strcpy(act3_terra,TERRA);
  }
  
  else{							//dropp soil (crescente)
    if( (value_terra_agua>valor1)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act1_terra,TERRA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act1_terra,FLOOR2);
	}
	
	if( (value_terra_agua>=valor2)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act2_terra,TERRA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act2_terra,FLOOR2);
	}
	
	if( (value_terra_agua>=valor3)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act3_terra,TERRA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act3_terra,FLOOR2);
	}
	
	if (value_terra_agua<=valor1)
	{
		strcpy(show_terra,RED);
		strcpy(act1_terra,FLOOR2);
		strcpy(act2_terra,FLOOR2);
		strcpy(act3_terra,FLOOR2);	
	}
  }
   
  
  //RGB-agua  
  if (prev_value_reserva > value_reserva){			//wait (decrescente)
		
    strcpy(show_agua,GREEN);
    strcpy(act1_agua,AGUA);
    strcpy(act2_agua,AGUA);
    strcpy(act3_agua,AGUA);
  }
  
  else{							//dropp soil (crescente)
    if( (value_reserva>valoragua1)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act1_agua,AGUA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act1_agua,FLOOR3);
	}
	
	if( (value_reserva>=valoragua2)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act2_agua,AGUA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act2_agua,FLOOR3);
	}
	
	if( (value_reserva>=valoragua3)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act3_agua,AGUA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act3_agua,FLOOR3);
	}
	
	if (value_reserva<=valoragua1)
	{
		strcpy(show_agua,RED);
		strcpy(act1_agua,FLOOR3);
		strcpy(act2_agua,FLOOR3);
		strcpy(act3_agua,FLOOR3);	
	}
  }

  prev_value_reserva=value_reserva;
	   
   }
   
   if(troca==1) {
      //RGB-terra  
      
 
  if (prev_value_terra_agua > value_terra_agua){			//wait (decrescente)
		
    strcpy(show_terra,GREEN);
    strcpy(act1_terra,AGUA);
    strcpy(act2_terra,AGUA);
    strcpy(act3_terra,AGUA);
  }
  
  else{							//dropp soil (crescente)
    if( (value_terra_agua>valor1)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act1_terra,AGUA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act1_terra,FLOOR2);
	}
	
	if( (value_terra_agua>=valor2)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act2_terra,AGUA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act2_terra,FLOOR2);
	}
	
	if( (value_terra_agua>=valor3)  ){
	    strcpy(show_terra,GREEN);
		strcpy(act3_terra,AGUA);
	}
	
	else {
	    strcpy(show_terra,GREEN);
		strcpy(act3_terra,FLOOR2);
	}
	
	if (value_terra_agua<=valor1)
	{
		strcpy(show_terra,RED);
		strcpy(act1_terra,FLOOR2);
		strcpy(act2_terra,FLOOR2);
		strcpy(act3_terra,FLOOR2);	
	}
  }

  
  //RGB-agua  
  if (prev_value_reserva > value_reserva){			//wait (decrescente)
		
    strcpy(show_agua,GREEN);
    strcpy(act1_agua,TERRA);
    strcpy(act2_agua,TERRA);
    strcpy(act3_agua,TERRA);
  }
  
  else{							//dropp soil (crescente)
    if( (value_reserva>valoragua1)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act1_agua,TERRA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act1_agua,FLOOR3);
	}
	
	if( (value_reserva>=valoragua2)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act2_agua,TERRA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act2_agua,FLOOR3);
	}
	
	if( (value_reserva>=valoragua3)  ){
	    strcpy(show_agua,GREEN);
		strcpy(act3_agua,TERRA);
	}
	
	else {
	    strcpy(show_agua,GREEN);
		strcpy(act3_agua,FLOOR3);
	}
	
	if (value_reserva<=valoragua1)
	{
		strcpy(show_agua,RED);
		strcpy(act1_agua,FLOOR3);
		strcpy(act2_agua,FLOOR3);
		strcpy(act3_agua,FLOOR3);	
	}
  }
  prev_value_reserva=value_reserva;
  
  
}


  //RGB-temperatura  
  if (value_temp > 21.75){			//too hot - turn down heater, sensor indicates hot
   	  
   	  if(value_temp >= 22.1){
		  sprintf(file,"MsgCreatorConf.txt");
		  
			sprintf(cond,"-n 5 -l 100 -f 1 -c 1 -s [1,3] -d [['C',50.0,900.0,0.5],['L',1.0,40.0,-1]] -i 1");

		  
		  Fmsg = fopen(file,"w");
		  fputs(cond, Fmsg);
		  fclose(Fmsg);
		//prev_value_temp=value_temp;  
		}
		
    strcpy(show_temp,RED);
    strcpy(act1_temp,BLUE);
  }
  
  else if (value_temp < 21.25){	//too cold - turn up heater, sensor indicates cold
    
		if(value_temp <= 20.9){
		  sprintf(file,"MsgCreatorConf.txt");
			sprintf(cond,"-n 5 -l 100 -f 1 -c 1 -s [1,3] -d [['C',50.0,900.0,0.5],['L',1.0,40.0,1]] -i 1");
		  
		  Fmsg = fopen(file,"w");
		  fputs(cond, Fmsg);
		  fclose(Fmsg);
		  //prev_value_temp=value_temp;  
		}
    strcpy(show_temp,BLUE);
    strcpy(act1_temp,RED);
  }
  
  else{							//good - heater off, sensor indicates good (green)
    strcpy(show_temp,GREEN);
    strcpy(act1_temp,WHITE);
  }
  
  //RGB-luz  
  if (value_light > 500){		//too bright - turn off light, sensor indicates white
    strcpy(show_light,WHITE);
    strcpy(act1_light,FLOOR);
    strcpy(act2_light,FLOOR);
    
  }
  
  else if (value_light < 200){	//too dark - turn on light, sensor indicates dark/black
    strcpy(show_light,BLACK);
    strcpy(act1_light,LUZ_FORTE);
    strcpy(act2_light,LUZ_FRACA);
  }
  
  else{							//good - light medium, sensor indicates good (green)
    strcpy(show_light,GREEN);
    strcpy(act1_light,LUZ_FORTE);
    strcpy(act2_light,FLOOR);
  }
  
  //RGB-humidade  
  if(prev_value_rega>value_hum){ //esta a decrescer
	 strcpy(show_hum,TERRA);
    strcpy(show2_hum,GREEN);    
    strcpy(act1_hum,FLOOR5);    
    strcpy(show_abacate,ABACATE);
    strcpy(show3_hum,TERRA_MOLHADA);
  }
  if (value_hum > 2.5){			//too wet - turn off water, sensor indicates wet soil
    
    if(value_hum >= 2.6){
		  sprintf(file,"MSG_3/MsgCreatorConf.txt");
		  
			sprintf(cond,"-n 5 -l 100 -f 1 -c 1 -s [2,4] -d [['L',1.0,5.0,1],['L',1.0,13.0,-1]] -i 1");
		  
		  
		  Fmsg = fopen(file,"w");
		  fputs(cond, Fmsg);
		  fclose(Fmsg);
		  
		}
    strcpy(show_hum,TERRA_MOLHADA);
    strcpy(show2_hum,BLUE);
    strcpy(act1_hum,FLOOR5);
    strcpy(show_abacate,FLOOR5);
    strcpy(show3_hum,TERRA);
  }
  
  else if (value_hum < 2.2){		//too dry - turn on water, sensor indicates soil normal?
    
    if(value_hum <= 2.1){
		  sprintf(file,"MSG_3/MsgCreatorConf.txt");
		  
			sprintf(cond,"-n 5 -l 100 -f 1 -c 1 -s [2,4] -d [['L',1.0,5.0,1],['L',1.0,13.0,1]] -i 1");
		 
		  
		  Fmsg = fopen(file,"w");
		  fputs(cond, Fmsg);
		  fclose(Fmsg);
		  
		}
	strcpy(show3_hum,TERRA_MOLHADA);
    strcpy(show_hum,TERRA);
    strcpy(show2_hum,RED);
    strcpy(act1_hum,AGUA);
    strcpy(show_abacate,FLOOR5);
  }
  
  else{							//good - water off, sensor indicates soil normal
    strcpy(show_hum,TERRA);
    strcpy(show2_hum,GREEN);    
    strcpy(act1_hum,FLOOR5);    
    strcpy(show_abacate,ABACATE);
    strcpy(show3_hum,TERRA_MOLHADA);
  }
  
prev_value_rega=value_hum;
  
  
  if(value_curr>12) // como a tensao é fixa (230V) atingimos a potencia maxima 20*230=460W	-> deliga todos os atuadores e desliga atuador de energia de todas as celulas
  {
	  strcpy(act1_seed,FLOOR1);
	  strcpy(act1_agua,FLOOR3);
	  strcpy(act2_agua,FLOOR3);
	  strcpy(act3_agua,FLOOR3);
	  strcpy(act1_terra,FLOOR2);
	  strcpy(act2_terra,FLOOR2);
	  strcpy(act3_terra,FLOOR2);
	  strcpy(act1_light,FLOOR);
	  strcpy(act2_light,FLOOR);
	  strcpy(act1_temp,WHITE);
	  strcpy(act1_hum,FLOOR5);
	  
	  strcpy(act1_curr,RED);
	  }
	  
	  else 		// dentro de parametros de consumo ok -> atuador de energia ligado em todas as celulas
	  {
		 strcpy(act1_curr,GREEN_CONSUMO);
	  }
	  

	 
  if(ativarcelula==1){
	fprintf(matrix_channel,"%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s","["
																																												 FLOOR1,BLACK,BLACK,BLACK,BLACK, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 show_seed,FLOOR1,FLOOR1,FLOOR1,BLACK, show_light,FLOOR,FLOOR,FLOOR,act1_temp, FLOOR,BLACK,BLACK,BLACK,BLACK,\
																																												 act1_curr,FLOOR1,FLOOR1,act1_seed,BLACK, show_temp,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,TERRA,TERRA,TERRA,BLACK,\
																																												 FLOOR1,FLOOR1,FLOOR1,FLOOR1,BLACK,  act1_curr,FLOOR,ARVORE,ARVORE,ARVORE, ARVORE,TERRA,TERRA,TERRA,BLACK, \
																																												 FLOOR1,BLACK,BLACK,BLACK,BLACK,  FLOOR,act2_light,FLOOR,FLOOR,FLOOR, FLOOR,TERRA,TERRA,TERRA,BLACK,\
																																												 FLOOR2,BLACK,BLACK,BLACK,BLACK, FLOOR,act2_light,act1_light,FLOOR,FLOOR, FLOOR,BLACK,BLACK,BLACK,BLACK,\
																																												 show_terra,act3_terra,act2_terra,act1_terra,BLACK,FLOOR, act1_light,act2_light,act2_light,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 act1_curr,act3_terra,act2_terra,SEMENTE,BLACK, ATUADOR_LUZ,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 FLOOR2,act3_terra,act2_terra,act1_terra,BLACK, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5,\
																																												 FLOOR2,BLACK,BLACK,BLACK,BLACK, show2_hum,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,BLACK,BLACK,BLACK,BLACK,\
																																												 FLOOR3,WHITE,WHITE,WHITE,WHITE, act1_curr,FLOOR5,FLOOR5,show_abacate,FLOOR5, FLOOR5,show_hum,show3_hum,show_hum,BLACK,\
																																												 show_agua,act3_agua,act2_agua,act1_agua,WHITE, FLOOR5,FLOOR5,ARVORE,ARVORE,ARVORE, ARVORE,show3_hum,show_hum,TERRA,BLACK,\
																																												 act1_curr,act3_agua,act2_agua,act1_agua,WHITE, act1_hum,act1_hum,FLOOR5,act1_hum,FLOOR5, act1_hum,show_hum,show3_hum,show_hum,BLACK,\
																																												 FLOOR3,act3_agua,act2_agua,act1_agua,WHITE, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,BLACK,BLACK,BLACK,BLACK,\
																																												 FLOOR3,WHITE,WHITE,WHITE,WHITE, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5"]\n");	

  
	}
	else if(ativarcelula==0){
		
		fprintf(matrix_channel,"%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s","["
																																												 BLACK,BLACK,BLACK,BLACK,BLACK, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 BLACK,BLACK,BLACK,BLACK,BLACK, show_light,FLOOR,FLOOR,FLOOR,act1_temp, FLOOR,BLACK,BLACK,BLACK,BLACK,\
																																												 BLACK,BLACK,BLACK,BLACK,BLACK, show_temp,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,TERRA,TERRA,TERRA,BLACK,\
																																												 BLACK,BLACK,BLACK,BLACK,BLACK,  act1_curr,FLOOR,ARVORE,ARVORE,ARVORE, ARVORE,TERRA,TERRA,TERRA,BLACK, \
																																												 BLACK,BLACK,BLACK,BLACK,BLACK,  FLOOR,act2_light,FLOOR,FLOOR,FLOOR, FLOOR,TERRA,TERRA,TERRA,BLACK,\
																																												 FLOOR2,BLACK,BLACK,BLACK,BLACK, FLOOR,act2_light,act1_light,FLOOR,FLOOR, FLOOR,BLACK,BLACK,BLACK,BLACK,\
																																												 show_terra,act3_terra,act2_terra,act1_terra,BLACK,FLOOR, act1_light,act2_light,act2_light,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 act1_curr,act3_terra,act2_terra,SEMENTE,BLACK, ATUADOR_LUZ,FLOOR,FLOOR,FLOOR,FLOOR, FLOOR,FLOOR,FLOOR,FLOOR,FLOOR,\
																																												 FLOOR2,act3_terra,act2_terra,act1_terra,BLACK, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5,\
																																												 FLOOR2,BLACK,BLACK,BLACK,BLACK, show2_hum,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,BLACK,BLACK,BLACK,BLACK,\
																																												 FLOOR3,WHITE,WHITE,WHITE,WHITE, act1_curr,FLOOR5,FLOOR5,show_abacate,FLOOR5, FLOOR5,show_hum,show3_hum,show_hum,BLACK,\
																																												 show_agua,act3_agua,act2_agua,act1_agua,WHITE, FLOOR5,FLOOR5,ARVORE,ARVORE,ARVORE, ARVORE,show3_hum,show_hum,TERRA,BLACK,\
																																												 act1_curr,act3_agua,act2_agua,act1_agua,WHITE, act1_hum,act1_hum,FLOOR5,act1_hum,FLOOR5, act1_hum,show_hum,show3_hum,show_hum,BLACK,\
																																												 FLOOR3,act3_agua,act2_agua,act1_agua,WHITE, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,BLACK,BLACK,BLACK,BLACK,\
																																												 FLOOR3,WHITE,WHITE,WHITE,WHITE, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5, FLOOR5,FLOOR5,FLOOR5,FLOOR5,FLOOR5"]\n");	

  
		
		
		}
	fclose(matrix_channel);

	
  }
 


int main()
{	
  while(1){  
  
  // Obtain data from the temperature sensor
  light = check_sensor_2();
  temp = check_sensor_1();
  hum = check_sensor_3();
  terra_agua=check_agua_terra();
  curr=check_curr();
  reserva=check_reserva();
  seed_extra=check_seed_extra();
  
  // Decide and Print the colors of the cells to the RGB Matrix
  writeRGBmatrix(temp, light, hum, terra_agua, curr, reserva, seed_extra);
  }	
}
