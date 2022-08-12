//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_SaveSubEnitities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PROD_SaveSubEnitities
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	//ARRAY BOOLEAN(PROD_abo_ComponentsModified;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	//ARRAY LONGINT(PROD_al_ComponentsDEL;0)
	//ARRAY REAL(PROD_ar_ComponentsQTY;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(PROD_at_ComponentsDEL;0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	//ARRAY TEXT(PROD_at_FurtherCodeDEL;0)
	C_BOOLEAN:C305($_bo_SaveAnalysis; $_bo_SaveComponents; PRD_bo_FurtherFieldsLoaded; PROD_bo_AddSupplier)
	C_LONGINT:C283($_l_Index; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_SaveSubEnitities")
//NG MAy 2004
//this method saves the data from the arrays for FURTHER ANALYSES and components from the Products_In forms

If (PRD_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
	If (PRD_bo_FurtherFieldsLoaded)
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("PRD_FFSelection")>0)
			USE SET:C118("PRD_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		//CLEAR SET("ORD_FFSelection")
		FUR_UpdateFurtherFields(->[PRODUCTS:9])
		
		
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		//at least one further field has been modified
		
		
	End if 
	
	$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	
	
End if 

If (Count parameters:C259>=1)
	$_bo_SaveAnalysis:=($1=2) | ($1=3)
	$_bo_SaveComponents:=($1=1)
Else 
	$_bo_SaveAnalysis:=True:C214
	$_bo_SaveComponents:=True:C214
End if 
If ($_bo_SaveAnalysis)
	If (Size of array:C274(PROD_at_FurtherCodeDEL)>0)
		//there are Furthers to be deleted
		For ($_l_Index; 1; Size of array:C274(PROD_at_FurtherCodeDEL))
			READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=PROD_at_FurtherCodeDEL{$_l_Index})
			DELETE RECORD:C58([CONTRACT_RECORD_ANALYSIS:88])
		End for 
		
	End if 
	If (Size of array:C274(PROD_at_FurtherAnalysis)>0)
		
		
		For ($_l_Index; 1; Size of array:C274(PROD_abo_FurtherModified))
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & ; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=PROD_at_FurtherCode{$_l_Index})
			If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
				CREATE RECORD:C68([CONTRACT_RECORD_ANALYSIS:88])
				[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:="09"+[PRODUCTS:9]Product_Code:1
				[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2:=PROD_at_FurtherCode{$_l_Index}
			End if 
			DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
			
		End for 
		
	End if 
End if 
//```````
If ($_bo_SaveComponents)
	If (Size of array:C274(PROD_al_ComponentsDEL)>0)
		For ($_l_Index; 1; Size of array:C274(PROD_al_ComponentsDEL))
			READ WRITE:C146([COMPONENTS:86])
			QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=PROD_al_ComponentsDEL{$_l_Index})
			DELETE RECORD:C58([COMPONENTS:86])
		End for 
		ARRAY TEXT:C222(PROD_at_ComponentsDEL; 0)
	End if 
	If (Size of array:C274(PROD_al_ComponentID)>0)
		
		For ($_l_Index; 1; Size of array:C274(PROD_al_ComponentID))
			If (PROD_abo_ComponentsModified{$_l_Index})
				READ WRITE:C146([COMPONENTS:86])
				QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=PROD_al_ComponentID{$_l_Index})
				//QUERY([COMPONENTS];[COMPONENTS]Component Code=PROD_at_ComponentsCode{$_l_Index};*)
				//QUERY([COMPONENTS]; & ;[COMPONENTS]Product Code=[PRODUCTS]Product Code)
				If (Records in selection:C76([COMPONENTS:86])=0)
					CREATE RECORD:C68([COMPONENTS:86])
					[COMPONENTS:86]Component_Code:2:=PROD_at_ComponentsCode{$_l_Index}
					[COMPONENTS:86]Product_Code:1:=[PRODUCTS:9]Product_Code:1
					DB_SaveRecord(->[COMPONENTS:86])
				End if 
				[COMPONENTS:86]Quantity:3:=PROD_ar_ComponentsQTY{$_l_Index}
				DB_SaveRecord(->[COMPONENTS:86])
				PROD_abo_ComponentsModified{$_l_Index}:=False:C215
			End if 
		End for 
	End if 
End if 
//-
If (PROD_bo_AddSupplier)
	DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
End if 
ERR_MethodTrackerReturn("PROD_SaveSubEnitities"; $_t_oldMethodName)