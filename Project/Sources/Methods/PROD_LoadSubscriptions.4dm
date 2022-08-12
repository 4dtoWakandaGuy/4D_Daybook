//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LoadSubscriptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_LB_Subs;0)
	//ARRAY LONGINT(ORD_al_SubUnits;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY TEXT(ORD_at_SubsTypeCodes;0)
	//ARRAY TEXT(ORD_at_SubTypeNM;0)
	//ARRAY TEXT(ORD_at_SubUnits;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection; $_l_SubsTypeRow; $_l_UnitRow; PROD_PowerviewSubs)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadSubscriptions"; Form event code:C388)

$_l_RecordsInSelection:=Records in selection:C76([SUBSCRIPTIONS:93])


ARRAY TEXT:C222(ORD_at_SubsTypeCodes; 6)
ARRAY TEXT:C222(ORD_at_SubTypeNM; 6)
ORD_at_SubsTypeCodes{1}:="ISS"
ORD_at_SubTypeNM{1}:="Issue"
ORD_at_SubsTypeCodes{2}:="BIP"
ORD_at_SubTypeNM{2}:="Bill,  Invoice & Payment"
ORD_at_SubsTypeCodes{3}:="BIN"
ORD_at_SubTypeNM{3}:="Bill, Invoice but No Payment"
ORD_at_SubsTypeCodes{4}:="BNP"
ORD_at_SubTypeNM{4}:="Bill,  No Invoice but Payment"
ORD_at_SubsTypeCodes{5}:="BNN"
ORD_at_SubTypeNM{5}:="Bill, No Invoice & No Payment"
ORD_at_SubsTypeCodes{6}:="REN"
ORD_at_SubTypeNM{6}:="Renewal Letter"
ARRAY LONGINT:C221(ORD_al_SubUnits; 4)
ARRAY TEXT:C222(ORD_at_SubUnits; 4)
ORD_al_SubUnits{1}:=1
ORD_at_SubUnits{1}:="Day"
ORD_al_SubUnits{2}:=7
ORD_at_SubUnits{2}:="Week"
ORD_al_SubUnits{3}:=31
ORD_at_SubUnits{3}:="Month"
If (Records in selection:C76([SUBSCRIPTIONS:93])>0)  //This section to update the records...see also the trigger
	$_bo_ReadOnlyState:=Read only state:C362([SUBSCRIPTIONS:93])
	CREATE SET:C116([SUBSCRIPTIONS:93]; "$Related")
	QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]X_Subscription_Type:12="")
	If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
		//update them
		UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
		READ WRITE:C146([SUBSCRIPTIONS:93])
		FIRST RECORD:C50([SUBSCRIPTIONS:93])
		For ($_l_Index; 1; Records in selection:C76([SUBSCRIPTIONS:93]))
			If ([SUBSCRIPTIONS:93]Type:7#"")
				$_l_SubsTypeRow:=Find in array:C230(ORD_at_SubsTypeCodes; [SUBSCRIPTIONS:93]Type:7)
				If ($_l_SubsTypeRow>0)
					[SUBSCRIPTIONS:93]X_Subscription_Type:12:=ORD_at_SubTypeNM{$_l_SubsTypeRow}
				Else 
					
				End if 
				DB_SaveRecord(->[SUBSCRIPTIONS:93])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
			End if 
			NEXT RECORD:C51([SUBSCRIPTIONS:93])
			
		End for 
		
	End if 
	USE SET:C118("$Related")
	QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]X_Units_Type:13="")
	If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
		//update them
		UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
		READ WRITE:C146([SUBSCRIPTIONS:93])
		FIRST RECORD:C50([SUBSCRIPTIONS:93])
		For ($_l_Index; 1; Records in selection:C76([SUBSCRIPTIONS:93]))
			If ([SUBSCRIPTIONS:93]Unit_Number:6>0)
				$_l_UnitRow:=Find in array:C230(ORD_al_SubUnits; [SUBSCRIPTIONS:93]Unit_Number:6)
				
				
				If ($_l_UnitRow>0)
					[SUBSCRIPTIONS:93]X_Units_Type:13:=ORD_at_SubUnits{$_l_UnitRow}
				Else 
					
				End if 
				DB_SaveRecord(->[SUBSCRIPTIONS:93])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
				
				
			End if 
			NEXT RECORD:C51([SUBSCRIPTIONS:93])
			
		End for 
		
	End if 
	UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
	If ($_bo_ReadOnlyState)
		READ ONLY:C145([SUBSCRIPTIONS:93])
	End if 
	USE SET:C118("$Related")
	CLEAR SET:C117("$Related")
	
End if 
ARRAY POINTER:C280(SUBS_aPtr_LBSettings; 0)
//ORD_LB_Subs
LBi_ArrDefFill(->SUBS_aPtr_LBSettings; ->ORD_LB_Subs; ->[SUBSCRIPTIONS:93]x_ID:11; ->[PRODUCTS:9]Product_Code:1; "211111126"; ""; 1; "Subscriptions"; "Subscription")

LBi_LoadSetup(->SUBS_aPtr_LBSettings; "B")

//Here we will set the columns type name and unit name to use the pop-ups
ERR_MethodTrackerReturn("PROD_LoadSubscriptions"; $_t_oldMethodName)