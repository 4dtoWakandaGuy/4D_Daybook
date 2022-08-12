If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.oFurl
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
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FIeldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; PROD_t_CurFurtherCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.oFurl"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FIeldNumber)
		$_l_Row:=Self:C308->
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FIeldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->PRD_lb_ProdFurths; $_t_VariableName)
		If ($_l_event=On Clicked:K2:4)
			LB_GoToCell(->PRD_lb_ProdFurths; $_l_ColumnNumber; $_l_Row)
			
		End if 
		Case of 
				
			: ($_l_event=On Data Change:K2:15)
				Case of 
					: ($_l_ColumnNumber=1)  // furthers code)
						PROD_t_CurFurtherCode:=PROD_at_FurtherCode{$_l_Row}
						
						Check_Minor(->PROD_at_FurtherCode{$_l_Row}; "Analysis"; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In")
						PROD_t_CurFurtherCode:=PROD_at_FurtherCode{$_l_Row}
						If (PROD_t_CurFurtherCode#"")
							If ([ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1#PROD_t_CurFurtherCode)
								QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=PROD_t_CurFurtherCode)
							End if 
							PROD_at_FurtherAnalysis{$_l_Row}:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
							PROD_at_FurtherCode{$_l_Row}:=PROD_t_CurFurtherCode
							PROD_abo_FurtherModified{$_l_Row}:=True:C214
						Else 
							PROD_at_FurtherAnalysis{$_l_Row}:=""
							PROD_at_FurtherCode{$_l_Row}:=""
							PROD_abo_FurtherModified{$_l_Row}:=True:C214
						End if 
						Products_InMod
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.oFurl"; $_t_oldMethodName)
