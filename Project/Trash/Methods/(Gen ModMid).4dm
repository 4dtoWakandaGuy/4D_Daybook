//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ModMid
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 14:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(aPop1;0)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; <>ViewLists; INT_bo_DetailOpen)
	C_LONGINT:C283(<>DB_l_CBShowLinkedRecord; <>SYS_l_LoggedInaccount; $_l_CallBackProcess; $7; MOD_l_CurrentModuleAccess; vNo)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_CurrentOutputform; $_t_FormReference; $_t_oldMethodName; $1; $2; $5; $6; $8; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModMid")
ARRAY TEXT:C222(aPop1; 0)
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (Count parameters:C259>=7)
	$_l_CallBackProcess:=$7
End if 

If ($4->=1)
	If ((Records in selection:C76($3->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
		CREATE SET:C116($3->; $2)
		CREATE EMPTY SET:C140($3->; "Userset")
		vNo:=Records in selection:C76($3->)
		If (Count parameters:C259>=8)
			DB_t_CurrentFormUsage:=$8
		End if 
		
		If ($6#"")
			
			WIN_t_CurrentOutputform:=$6
			
		Else 
			DB_t_CurrentFormUsage:=WIN_t_CurrentOutputform
		End if 
		$_t_FormReference:=""
		If ((vAutoFind) & (<>DB_bo_AutoOut))
			//ALERT("10")  `4/1/2010
			Open_Pro_Window($1; 0; 1; $3; WIN_t_CurrentOutputform)
			$_t_FormReference:=""
			//ALERT("11")  `4/1/2010
			PROC_SetProcess(Current process:C322; 0; $_l_CallBackProcess)
			//ALERT("12")  `4/1/2010
			Gen_ModMidAP($2; $3; $5)
		Else 
			If (((<>ViewLists=False:C215) | (<>DB_l_CBShowLinkedRecord=1)) & (Records in selection:C76($3->)=1) & (MOD_l_CurrentModuleAccess#3) & (Not:C34(Read only state:C362($3->))) & (Not:C34(Locked:C147($3->))))
				<>DB_l_CBShowLinkedRecord:=0  // always reset this-it gets loaded again
				If (WIN_t_CurrentInputForm="Diary_InEmail") & (Table:C252($3)=Table:C252(->[DIARY:12])) & (True:C214)
					Open_Pro_Window($1; 0; 2; $3; WIN_t_CurrentInputForm)
					$_t_FormReference:=Table name:C256($3)+"_"+WIN_t_CurrentInputForm
					PROC_SetProcess(Current process:C322; 0; $_l_CallBackProcess)
					FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
					READ WRITE:C146([USER:15])
					If (<>SYS_l_LoggedInaccount=0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
					End if 
					MODIFY RECORD:C57([USER:15]; *)
				Else 
					//ALERT("10-a")  `4/1/2010
					Open_Pro_Window($1; 0; 2; $3; WIN_t_CurrentInputForm)
					//ALERT("11-a")  `4/1/2010
					$_t_FormReference:=Table name:C256($3)+"_"+WIN_t_CurrentInputForm
					//ALERT("12-a")  `4/1/2010
					PROC_SetProcess(Current process:C322; 0; $_l_CallBackProcess)
					MODIFY RECORD:C57($3->; *)
					If (OK=0)
						If (Count parameters:C259>=4)
							$4->:=-1
						End if 
					End if 
					
				End if 
				
			Else 
				//ALERT("10-b")  `4/1/2010
				Open_Pro_Window($1; 0; 1; $3; WIN_t_CurrentOutputform)
				//ALERT("11-b")  `4/1/2010
				$_t_FormReference:=""
				PROC_SetProcess(Current process:C322; 0; $_l_CallBackProcess)
				//ALERT("12-b")  `4/1/2010
				Gen_Mod2($2; $3; $5; $4)
			End if 
		End if 
		If ($_t_FormReference#"")
			Close_ProWin($_t_FormReference)
		Else 
			Close_ProWin
		End if 
		
		If ($4->#-1)
			$4->:=0
		End if 
		
	Else 
		Gen_None($5; $4)
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ModMid"; $_t_oldMethodName)