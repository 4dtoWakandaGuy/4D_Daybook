//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ModLay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; <>ViewLists; $10)
	C_LONGINT:C283(<>DB_l_CBShowLinkedRecord; vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $6; $7; $8; $9; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModLay")

Start_Process($1)
If (Execute_File($2))  //NG modified June 2004
	While ($5->=1)
		IDLE:C311  // 03/04/03 pb
		DB_t_CurrentFormUsage:=$8
		If (Count parameters:C259>=10)
			//Currently(Feb 2007 there is not handling for this in Calls_Mod0...this auto opens the more choices search..but it we wanted to get a list open calls...
			
			Execute_Sel($6; $9; $10)
		Else 
			Execute_Sel($6)
		End if 
		DB_t_CurrentFormUsage:=""
		If ($5->=1)
			If ((Records in selection:C76($4->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
				CREATE SET:C116($4->; $3)
				vNo:=Records in selection:C76($4->)
				
				If ((vAutoFind) & (<>DB_bo_AutoOut))
					Open_Pro_Window($1)
					Gen_ModMidAP($3; $4; $7)
				Else 
					If (((<>ViewLists=False:C215) | (<>DB_l_CBShowLinkedRecord=1)) & (Records in selection:C76($4->)=1) & (Not:C34(Read only state:C362($4->))))
						<>DB_l_CBShowLinkedRecord:=0  // always reset this-it gets loaded again
						
						Open_Pro_Window($1; 0; 2; $4; WIN_t_CurrentInputForm)  //NG may 2004 added form reference
						
						MODIFY RECORD:C57($4->; *)
					Else 
						Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
						Gen_Mod2($3; $4; $7)
					End if 
				End if 
				Close_ProWin
				$5->:=0
			Else 
				Gen_None($7; $5)
			End if 
		End if 
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Gen_ModLay"; $_t_oldMethodName)