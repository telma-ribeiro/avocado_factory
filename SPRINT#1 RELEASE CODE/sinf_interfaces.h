#ifndef _sinf_interfaces_h_
#define _sinf_interfaces_h_
#endif


//Function Definition

struct Measurements_byte{
	
	char *light1[2];
	char *light2[2];
	char *temp1[2];
	char *temp2[2];
	char *hum1[2];
	char *hum2[2];
	char *curr1[2];
	char *curr2[2];
	char *mote[2];
};

struct Measurements{
	int mote_id;
	int light;
	int humidity;
	int temperature;
	float current;
};

struct Actuators{
	int heater_on;
};


float byte2long(char *byte1, char *byte2);
long value2light(long light);
int value2hum(long hum);
int value2temp(long temp);
float value2curr(long curr);
int value2humcomp(long temp, long hum, long value);

void readSensors(struct Measurements *sensors,char *str);
void checkRules(struct Measurements *sensors, struct Actuators *actuators, int rooms, int *temp_threshold);
void writeRGBMatrix(struct Measurements *sensors, struct Actuators *actuators, int rooms, int *temp_threshold, int NUMBER_CELLS);

