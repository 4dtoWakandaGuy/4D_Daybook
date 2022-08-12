//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_SaveProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 11:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY TEXT(SC_at_ProductCode;0)
	//ARRAY TEXT(SC_at_ProductContract;0)
	//ARRAY TEXT(SC_at_ProductName;0)
	//ARRAY TEXT(SC_at_ProductSerial;0)
	//ARRAY TEXT(SC_at_Systems;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_SaveProducts")
//this method which will run when we save a
//service call
//will update from the arrays any subrecords
For ($_l_Index; 1; Size of array:C274(SC_at_ProductCode))
	If (SC_al_ProductItemID{$_l_Index}<0)
		//needs saving or updating
		QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
		QUERY SELECTION:C341([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]SCProductXID:6=Abs:C99(SC_al_ProductItemID{$_l_Index}))
		If (Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])=0)
			//create
			CREATE RECORD:C68([SERVICE_CALLS_PRODUCTS:152])
			[SERVICE_CALLS_PRODUCTS:152]ID:7:=AA_GetNextID(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
			[SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8:=[SERVICE_CALLS:20]Call_Code:4
			[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6:=(Abs:C99(SC_al_ProductItemID{$_l_Index}))
		End if 
		[SERVICE_CALLS_PRODUCTS:152]Product_Code:1:=SC_at_ProductCode{$_l_Index}
		[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2:=SC_at_ProductSerial{$_l_Index}
		[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3:=SC_at_ProductContract{$_l_Index}
		[SERVICE_CALLS_PRODUCTS:152]System:4:=SC_at_Systems{$_l_Index}
		[SERVICE_CALLS_PRODUCTS:152]Product_Name:5:=SC_at_ProductName{$_l_Index}
		DB_SaveRecord(->[SERVICE_CALLS_PRODUCTS:152])
		
	End if 
End for 
ERR_MethodTrackerReturn("SC_SaveProducts"; $_t_oldMethodName)
