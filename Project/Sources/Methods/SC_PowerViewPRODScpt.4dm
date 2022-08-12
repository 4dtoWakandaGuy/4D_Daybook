//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_PowerViewPRODScpt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY TEXT(SC_at_ContractDatesStrings;0)
	//ARRAY TEXT(SC_at_ContractTypeCode;0)
	//ARRAY TEXT(SC_at_ContractTypeName;0)
	//ARRAY TEXT(SC_at_ProductCode;0)
	//ARRAY TEXT(SC_at_ProductContract;0)
	//ARRAY TEXT(SC_at_ProductName;0)
	//ARRAY TEXT(SC_at_ProductSerial;0)
	//ARRAY TEXT(SC_at_Systems;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ButtonEvent; $_l_Event; $1; $2; $3; ALbuttonEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_PowerViewPRODScpt")
//C_LONGINT($1;$2;$3;ALbuttonEvent)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//do the setup of the AreaList Pro object here
	: ($_l_Event=On Data Change:K2:15)
		
		If (FORM Get current page:C276=2)
			$_l_ButtonEvent:=ALbuttonEvent
			ALbuttonEvent:=0
			Case of 
				: ($_l_ButtonEvent=21)  //add record
					If (Not:C34([SERVICE_CALLS:20]Resolved:9))
						INSERT IN ARRAY:C227(SC_at_ProductCode; 1)
						INSERT IN ARRAY:C227(SC_at_ProductSerial; 1)
						INSERT IN ARRAY:C227(SC_at_Systems; 1)
						INSERT IN ARRAY:C227(SC_at_ProductName; 1)
						INSERT IN ARRAY:C227(SC_at_ProductContract; 1)
						INSERT IN ARRAY:C227(SC_at_ContractTypeCode; 1)
						INSERT IN ARRAY:C227(SC_at_ContractDatesStrings; 1)
						INSERT IN ARRAY:C227(SC_at_ContractTypeName; 1)
						INSERT IN ARRAY:C227(SC_al_ProductItemID; 1)
						//AL_UpdateArrays (SC_PowerviewProd;-2)
					End if 
					
			End case 
		End if 
		
		
		
	: ($_l_Event=On Outside Call:K2:11)
		
End case 
ERR_MethodTrackerReturn("SC_PowerViewPRODScpt"; $_t_oldMethodName)
