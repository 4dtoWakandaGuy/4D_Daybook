//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_ProductNC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_Ptr_Variable; $1)
	C_TEXT:C284($_t_oldMethodName; $2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ProductNC")
//Check_Product No Create

OK:=1
If ($1->#"")
	$1->:=Check_QM($1->)
	Prod_Sel2($1->)
	If (Records in selection:C76([PRODUCTS:9])>1)
		Check_DispNum(->[PRODUCTS:9]; "Products")
		If (OK=1)
			DB_t_CurrentFormUsage2:="NC"
			Check_Prod2
			If (OK=0)
				GOTO OBJECT:C206($1->)
			End if 
			DB_t_CurrentFormUsage2:=""
		End if 
	Else 
		If (Records in selection:C76([PRODUCTS:9])=0)
			Gen_Alert("No Products found"; "Try again")
			GOTO OBJECT:C206($1->)
		End if 
	End if 
	If ($2#"")
		$_Ptr_Variable:=Get pointer:C304("v"+$2)
		If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
			
			$_Ptr_Variable->:=[PRODUCTS:9]Product_Name:2
		End if 
	End if 
	$1->:=[PRODUCTS:9]Product_Code:1
Else 
	REDUCE SELECTION:C351([PRODUCTS:9]; 0)
	If ($2#"")
		$_Ptr_Variable:=Get pointer:C304("v"+$2)
		If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
			
			$_Ptr_Variable->:=""
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Check_ProductNC"; $_t_oldMethodName)