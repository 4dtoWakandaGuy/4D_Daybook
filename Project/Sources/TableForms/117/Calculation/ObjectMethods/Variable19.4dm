If (False:C215)
	//object Name: [EW_ExportProjects]Calculation.Variable19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_NumericFields;0)
	C_LONGINT:C283(r1; r2; r3; r4)
	C_REAL:C285(EW_r_DiscountPercentage; EW_r_MarkupPercentage; EW_r_PricePercentage)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Calculation.Variable19"; Form event code:C388)
//[Calculations]entry
// bOK button

Case of 
	: ((EW_at_NumericFields=0) & (r3=0))
		//    ALERT("Please select a field.")
		Gen_Alert("Please select a field.")
	: ((r1=1) & (EW_r_DiscountPercentage=0))
		//    ALERT("Please specify a discount percentage.")
		Gen_Alert("Please specify a discount percentage.")
		GOTO OBJECT:C206(EW_r_DiscountPercentage)
	: ((r2=1) & (EW_r_MarkupPercentage=0))
		//    ALERT("Please specify a markup percentage.")
		Gen_Alert("Please specify a markup percentage.")
		GOTO OBJECT:C206(EW_r_MarkupPercentage)
	: ((r4=1) & (EW_r_PricePercentage=0))
		//   ALERT("Please specify a percentage.")
		Gen_Alert("Please specify a percentage.")
		GOTO OBJECT:C206(EW_r_PricePercentage)
	: ([EW_ExportSteps:118]BKModelName:8#"") & (EW_at_BKFieldNames<1)
		//    ALERT("Please select an ecommerce field for this calculation.")
		Gen_Alert("Please select an ecommerce field for this calculation.")
		
	Else 
		ACCEPT:C269
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Calculation.Variable19"; $_t_oldMethodName)
