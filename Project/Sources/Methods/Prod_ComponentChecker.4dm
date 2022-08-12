//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_ComponentChecker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/06/2010 13:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; PROD_bo_CompCheckReady; PROD_bo_EndComponentProcess; PROD_bo_ShowAlert)
	C_LONGINT:C283($_l_CallBackProcess; $_l_ParentProcessState; $1; PROD_l_ComponentResult)
	C_TEXT:C284($_t_oldMethodName; $2; $3; PROD_t_ParentProductCode; PROD_t_ProductCode; PROD_t_RetProductCode; PROD_t_RetProductName; vProdCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_ComponentChecker")
Start_Process
//NG NEW method may 2005
//this method (Called as a process)
//will stay resident during the creation or editing of products if components are involved.
//it can be called to return a product code and product name and replaces the functions of a method called Check_ProdSu
//this is currently called by the form method [components]Components_Sub and moves the current record pointer
//this process will end when the product viewing Process_Ends(using exactly the same code used to Close_Processesses from the
//companies screen


READ ONLY:C145([PRODUCTS:9])
PROD_bo_ShowAlert:=True:C214

If (Count parameters:C259>=1)
	$_l_CallBackProcess:=$1
	If (Count parameters:C259>=2)
		PROD_t_ParentProductCode:=$2
	End if 
	
	If (Count parameters:C259>=3)
		PROD_t_ProductCode:=$3
	End if 
	If (Count parameters:C259>=4)
		PROD_bo_ShowAlert:=True:C214
	End if 
	
	
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_bo_CompCheckReady; True:C214)
	Repeat 
		
		
		If (PROD_t_ProductCode="")
			Repeat 
				DelayTicks(30)
				$_l_ParentProcessState:=Process state:C330($_l_CallBackProcess)
				If ($_l_ParentProcessState<0)
					PROD_bo_EndComponentProcess:=True:C214
				End if 
			Until (PROD_t_ProductCode#"") | (PROD_bo_EndComponentProcess) | (<>SYS_bo_QuitCalled)
			
		End if 
		If (Not:C34(PROD_bo_EndComponentProcess)) & (Not:C34(<>SYS_bo_QuitCalled))
			If (PROD_t_ProductCode#"")
				If (Character code:C91(PROD_t_ProductCode[[Length:C16(PROD_t_ProductCode)]])#64) | (Length:C16(PROD_t_ProductCode)>1)
					
					If (PROD_t_ParentProductCode=PROD_t_ProductCode)
						If (PROD_bo_ShowAlert)
							Gen_Alert("You cannot add a product to itself as a component!")
						End if 
						
						SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; -1)
						PROD_t_ParentProductCode:=""
					Else 
						While (Semaphore:C143("$CompCheckerBusy"))
							DelayTicks(2)
						End while 
						Check_ProdSu(PROD_t_ProductCode; PROD_bo_ShowAlert)
						If (Records in selection:C76([PRODUCTS:9])=0)
							Gen_Alert("That product code does not exist!")
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; -2)
						Else 
							//product found
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_t_RetProductCode; vProdCode)
							If ([PRODUCTS:9]Product_Code:1#vProdCode)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProdCode)
							End if 
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_t_RetProductName; [PRODUCTS:9]Product_Name:2)
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; 1)
						End if 
						PROD_t_ParentProductCode:=""
						REDUCE SELECTION:C351([PRODUCTS:9]; 0)
						PROD_t_ProductCode:=""
						CLEAR SEMAPHORE:C144("$CompCheckerBusy")
						
					End if 
				Else 
					
					PROD_t_ParentProductCode:=""
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; -2)
				End if 
			Else 
				PROD_t_ParentProductCode:=""
				SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; -2)
			End if 
		Else 
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; PROD_l_ComponentResult; -1)
			PROD_t_ParentProductCode:=""
			
		End if 
	Until (PROD_bo_EndComponentProcess) | (<>SYS_bo_QuitCalled)
End if 
ERR_MethodTrackerReturn("Prod_ComponentChecker"; $_t_oldMethodName)
