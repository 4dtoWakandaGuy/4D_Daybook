If (False:C215)
	//object Name: [PRODUCTS]Products_inCAT.Variable7
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; r7; s1; s2; s3)
	C_TEXT:C284($_t_oldMethodName; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_inCAT.Variable7"; Form event code:C388)
If ((MOD_l_CurrentModuleAccess=3) | (Locked:C147([PRODUCTS:9])))
	r7:=Num:C11([PRODUCTS:9]Serial_Numbered:17)
Else 
	[PRODUCTS:9]Serial_Numbered:17:=(r7=1)
	If ([PRODUCTS:9]Serial_Numbered:17)
		OBJECT SET TITLE:C194(s1; "Assembled item")
		OBJECT SET TITLE:C194(s2; "Components")
		vTitle4:="Purchase Order"
		[PRODUCTS:9]Bundle_Assembly:36:=False:C215
		OBJECT SET ENABLED:C1123(s3; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_inCAT.Variable7"; $_t_oldMethodName)
