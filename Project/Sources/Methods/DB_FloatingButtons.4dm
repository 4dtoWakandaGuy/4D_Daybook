//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_FloatingButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>FloatingButtonsProcess)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	//ARRAY PICTURE(DB_apic_ToolPalleteICONS;0;0)
	//ARRAY TEXT(DB_at_ToolPalletteTIPS;0)
	//ARRAY TEXT(PAL_at_PopUpMenu1;0)
	//ARRAY TEXT(PAL_at_PopUpMenu10;0)
	//ARRAY TEXT(PAL_at_PopUpMenu11;0)
	//ARRAY TEXT(PAL_at_PopUpMenu12;0)
	//ARRAY TEXT(PAL_at_PopUpMenu13;0)
	//ARRAY TEXT(PAL_at_PopUpMenu14;0)
	//ARRAY TEXT(PAL_at_PopUpMenu15;0)
	//ARRAY TEXT(PAL_at_PopUpMenu16;0)
	//ARRAY TEXT(PAL_at_PopUpMenu17;0)
	//ARRAY TEXT(PAL_at_PopUpMenu18;0)
	//ARRAY TEXT(PAL_at_PopUpMenu19;0)
	//ARRAY TEXT(PAL_at_PopUpMenu2;0)
	//ARRAY TEXT(PAL_at_PopUpMenu20;0)
	//ARRAY TEXT(PAL_at_PopUpMenu21;0)
	//ARRAY TEXT(PAL_at_PopUpMenu22;0)
	//ARRAY TEXT(PAL_at_PopUpMenu23;0)
	//ARRAY TEXT(PAL_at_PopUpMenu24;0)
	//ARRAY TEXT(PAL_at_PopUpMenu25;0)
	//ARRAY TEXT(PAL_at_PopUpMenu26;0)
	//ARRAY TEXT(PAL_at_PopUpMenu27;0)
	//ARRAY TEXT(PAL_at_PopUpMenu28;0)
	//ARRAY TEXT(PAL_at_PopUpMenu29;0)
	//ARRAY TEXT(PAL_at_PopUpMenu3;0)
	//ARRAY TEXT(PAL_at_PopUpMenu30;0)
	//ARRAY TEXT(PAL_at_PopUpMenu31;0)
	//ARRAY TEXT(PAL_at_PopUpMenu32;0)
	//ARRAY TEXT(PAL_at_PopUpMenu4;0)
	//ARRAY TEXT(PAL_at_PopUpMenu5;0)
	//ARRAY TEXT(PAL_at_PopUpMenu6;0)
	//ARRAY TEXT(PAL_at_PopUpMenu7;0)
	//ARRAY TEXT(PAL_at_PopUpMenu8;0)
	//ARRAY TEXT(PAL_at_PopUpMenu9;0)
	C_BOOLEAN:C305(BUT_bo_ShowWindow; DB_bo_ProcessReady; DB_bo_VarsReady)
	C_LONGINT:C283($1; $3; $4; BUT_l_BUTTONWINLEFT; BUT_l_BUTTONWINTOP; BUT_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName; $2; $5; BUT_t_ButtonContext; BUT_t_ButtonSettings)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_FloatingButtons")
ARRAY LONGINT:C221(DB_al_ButtonsAssigned; 0)
ARRAY TEXT:C222(DB_at_ToolPalletteTIPS; 0)
ARRAY PICTURE:C279(DB_apic_ToolPalleteICONS; 0; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu1; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu2; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu3; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu4; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu5; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu6; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu7; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu8; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu9; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu10; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu11; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu12; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu13; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu14; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu15; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu16; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu17; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu18; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu19; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu20; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu21; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu22; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu23; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu24; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu25; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu26; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu27; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu28; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu29; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu30; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu31; 0)
ARRAY TEXT:C222(PAL_at_PopUpMenu32; 0)

DB_bo_VarsReady:=False:C215
BUT_bo_ShowWindow:=True:C214
BUT_t_ButtonSettings:=$2
BUT_l_CallBackProcess:=$1
BUT_l_BUTTONWINLEFT:=$3
BUT_l_BUTTONWINTOP:=$4
BUT_t_ButtonContext:=$5
DB_bo_ProcessReady:=True:C214
While (Not:C34(DB_bo_VarsReady))
	DelayTicks(2)
End while 
If (BUT_t_ButtonContext="input")
	
	Open window:C153($3; $4; $3+450; $4+48; Sheet window:K34:15)
Else 
	Open window:C153($3; $4; $3+360; $4+48; Sheet window:K34:15)
End if 

DIALOG:C40("BUTTONS_SUBFORM")
<>FloatingButtonsProcess:=0
ERR_MethodTrackerReturn("DB_FloatingButtons"; $_t_oldMethodName)