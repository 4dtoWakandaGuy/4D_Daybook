If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.oFurl1
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
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PROD_abo_ComponentsModified;0)
	//ARRAY INTEGER(PROD_ar_ComponentsQTY;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(PROD_at_ComponentsNM;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	C_BOOLEAN:C305(PROD_bo_CompCheckReady; PROD_bo_ShowAlert)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Retries; $_l_Row; $_l_TableNumber; $_l_UniqueRow; PROD_l_ComponentCheck; PROD_l_ComponentResult; PROD_l_curComponentsQTY)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode; $_t_Unique; $_t_VariableName; PROD_t_CurComponentsCode; PROD_t_curComponentsNM; PROD_t_ParentProductCode; PROD_t_ProductCode; PROD_t_RetProductCode; PROD_t_RetProductName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.oFurl1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->PRD_LB_ProdComponents; $_t_VariableName)
		If ($_l_event=On Clicked:K2:4)
			If ($_l_ColumnNumber=1) | ($_l_ColumnNumber=3)
				LB_GoToCell(->PRD_LB_ProdComponents; $_l_ColumnNumber; $_l_Row)
			Else 
				LISTBOX SELECT ROW:C912(PRD_LB_ProdComponents; $_l_Row; 0)
			End if 
		End if 
		
		Case of 
				
			: ($_l_event=On Data Change:K2:15)
				Case of 
					: ($_l_ColumnNumber=1)  // Component code
						//NG MAY 2004. Note this script is very different to that used on the subform area
						//the subform area moved the current record pointer. This uses a seperate process for searching so
						//the record pointer does not move
						
						If (PROD_l_ComponentCheck=0)
							PROD_l_ComponentCheck:=New process:C317("Prod_ComponentChecker"; 128000; "Check_Product Components"; Current process:C322; PROD_t_ParentProductCode)
							
						End if 
						Repeat 
							DelayTicks(5)
						Until (PROD_bo_CompCheckReady)
						PROD_l_ComponentResult:=0
						PROD_t_RetProductCode:=""
						PROD_t_RetProductName:=""
						$_l_Retries:=0
						While (Test semaphore:C652("$CompCheckerBusy"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						End while 
						SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ParentProductCode; [PRODUCTS:9]Product_Code:1)
						SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_bo_ShowAlert; True:C214)
						SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ProductCode; PROD_at_ComponentsCode{$_l_Row})
						RESUME PROCESS:C320(PROD_l_ComponentCheck)
						GET PROCESS VARIABLE:C371(PROD_l_ComponentCheck; PROD_t_ParentProductCode; $_t_ProductCode)
						$_l_Retries:=0
						While (Test semaphore:C652("$CompCheckerBusy")) | ($_t_ProductCode=[PRODUCTS:9]Product_Code:1)
							GET PROCESS VARIABLE:C371(PROD_l_ComponentCheck; PROD_t_ParentProductCode; $_t_ProductCode)
							
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						End while 
						Case of 
							: (PROD_l_ComponentResult=1)
								//PROD_aS25_CurComponentsCode:=PROD_t_RetProductCode
								$_t_Unique:=BLD_FIXEDLENGTH(25; [PRODUCTS:9]Product_Code:1; PROD_t_RetProductCode)
								
								$_l_UniqueRow:=Find in array:C230(PROD_at_ComponentUnique; $_t_Unique)
								//this is to stop you adding the same component twice!
								If ($_l_UniqueRow>0)
									If ($_l_UniqueRow#$_l_Row)
										//this component already exists!
										
										Gen_Alert("You cannot add the same component twice?"; "OK")
										PROD_t_CurComponentsCode:=""
									End if 
								Else 
									PROD_t_CurComponentsCode:=PROD_t_RetProductCode
									PROD_t_curComponentsNM:=PROD_t_RetProductName
									PROD_l_curComponentsQTY:=1
									
								End if 
								PROD_at_ComponentsCode{$_l_Row}:=PROD_t_CurComponentsCode
								PROD_at_ComponentsNM{$_l_Row}:=PROD_t_curComponentsNM
								PROD_ar_ComponentsQTY{$_l_Row}:=1
								PROD_at_ComponentUnique{$_l_Row}:=$_t_Unique
								PROD_abo_ComponentsModified{$_l_Row}:=True:C214
							: (PROD_l_ComponentResult=-2)
								PROD_at_ComponentsCode{$_l_Row}:=""
								LB_GoToCell(->PRD_LB_ProdComponents; 1; $_l_Row)
						End case 
						
						
						Products_InMod
					: ($_l_ColumnNumber=3)  // QTY
						Products_InMod
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.oFurl1"; $_t_oldMethodName)
