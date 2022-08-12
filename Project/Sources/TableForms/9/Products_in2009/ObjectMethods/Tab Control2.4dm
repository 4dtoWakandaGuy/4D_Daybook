If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Tab Control2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_event; vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Tab Control2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
				
			: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
				If ([PRICE_TABLE:28]Table_Code:12#"")
					DB_SaveRecord(->[PRICE_TABLE:28])
					
				End if 
		End case 
		vCT:=0
		
		LBi_RemoveAll(->PRD_aPtr_RelatedConfiguration)
		ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
		PRD_inonloadrelated("P1")
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.Tab Control2"; $_t_oldMethodName)
