//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ShowFloatingButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 09:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ProcessReady)
	C_LONGINT:C283(<>FloatingButtonsProcess; $1; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $2; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ShowFloatingButtons")
If (Count parameters:C259>=5)
	If (<>FloatingButtonsProcess=0)
		
		<>FloatingButtonsProcess:=New process:C317("DB_FloatingButtons"; 128000; "$FloatingButtons"; $1; $2; $3; $4; $5)
		DelayTicks(10)
		GET PROCESS VARIABLE:C371(<>FloatingButtonsProcess; DB_bo_ProcessReady; DB_bo_ProcessReady)
		While (Not:C34(DB_bo_ProcessReady))
			DelayTicks(2)
			GET PROCESS VARIABLE:C371(<>FloatingButtonsProcess; DB_bo_ProcessReady; DB_bo_ProcessReady)
		End while 
		
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_al_ButtonsAssigned; DB_al_ButtonsAssigned)
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_at_ToolPalletteTIPS; DB_at_ToolPalletteTIPS)
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_apic_ToolPalleteICONS; DB_apic_ToolPalleteICONS)
		If ($5="input")
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu1; PAL_at_PopUpMenu1)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu2; PAL_at_PopUpMenu2)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu3; PAL_at_PopUpMenu3)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu4; PAL_at_PopUpMenu4)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu5; PAL_at_PopUpMenu5)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu6; PAL_at_PopUpMenu6)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu7; PAL_at_PopUpMenu7)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu8; PAL_at_PopUpMenu8)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu9; PAL_at_PopUpMenu9)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu10; PAL_at_PopUpMenu19)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu11; PAL_at_PopUpMenu11)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu12; PAL_at_PopUpMenu12)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu13; PAL_at_PopUpMenu13)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu14; PAL_at_PopUpMenu14)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu15; PAL_at_PopUpMenu15)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu16; PAL_at_PopUpMenu16)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu17; PAL_at_PopUpMenu17)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu18; PAL_at_PopUpMenu18)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu19; PAL_at_PopUpMenu19)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu20; PAL_at_PopUpMenu20)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu21; PAL_at_PopUpMenu21)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu22; PAL_at_PopUpMenu22)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu23; PAL_at_PopUpMenu23)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu24; PAL_at_PopUpMenu24)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu25; PAL_at_PopUpMenu25)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu26; PAL_at_PopUpMenu26)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu27; PAL_at_PopUpMenu27)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu28; PAL_at_PopUpMenu28)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu29; PAL_at_PopUpMenu29)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu30; PAL_at_PopUpMenu30)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu31; PAL_at_PopUpMenu31)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu32; PAL_at_PopUpMenu32)
		End if 
		
		
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; DB_bo_VarsReady; True:C214)
	Else 
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_al_ButtonsAssigned; DB_al_ButtonsAssigned)
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_at_ToolPalletteTIPS; DB_at_ToolPalletteTIPS)
		VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; DB_apic_ToolPalleteICONS; DB_apic_ToolPalleteICONS)
		If ($5="input")
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu1; PAL_at_PopUpMenu1)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu2; PAL_at_PopUpMenu2)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu3; PAL_at_PopUpMenu3)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu4; PAL_at_PopUpMenu4)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu5; PAL_at_PopUpMenu5)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu6; PAL_at_PopUpMenu6)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu7; PAL_at_PopUpMenu7)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu8; PAL_at_PopUpMenu8)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu9; PAL_at_PopUpMenu9)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu10; PAL_at_PopUpMenu19)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu11; PAL_at_PopUpMenu11)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu12; PAL_at_PopUpMenu12)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu13; PAL_at_PopUpMenu13)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu14; PAL_at_PopUpMenu14)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu15; PAL_at_PopUpMenu15)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu16; PAL_at_PopUpMenu16)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu17; PAL_at_PopUpMenu17)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu18; PAL_at_PopUpMenu18)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu19; PAL_at_PopUpMenu19)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu20; PAL_at_PopUpMenu20)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu21; PAL_at_PopUpMenu21)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu22; PAL_at_PopUpMenu22)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu23; PAL_at_PopUpMenu23)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu24; PAL_at_PopUpMenu24)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu25; PAL_at_PopUpMenu25)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu26; PAL_at_PopUpMenu26)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu27; PAL_at_PopUpMenu27)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu28; PAL_at_PopUpMenu28)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu29; PAL_at_PopUpMenu29)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu30; PAL_at_PopUpMenu30)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu31; PAL_at_PopUpMenu31)
			VARIABLE TO VARIABLE:C635(<>FloatingButtonsProcess; PAL_at_PopUpMenu32; PAL_at_PopUpMenu32)
		End if 
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; BUT_l_BUTTONWINLEFT; $3)
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; BUT_l_BUTTONWINTOP; $4)
		
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; BUT_l_CallBackProcess; $1)
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; BUT_t_ButtonSettings; $2)
		
		SET PROCESS VARIABLE:C370(<>FloatingButtonsProcess; BUT_t_ButtonContext; $5)  // either output or input
		
		POST OUTSIDE CALL:C329(<>FloatingButtonsProcess)
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_ShowFloatingButtons"; $_t_oldMethodName)