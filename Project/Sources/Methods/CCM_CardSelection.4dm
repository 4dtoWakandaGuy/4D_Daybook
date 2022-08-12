//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_CardSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 21:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(<>CC_al_CardOwnerXID;0)
	//ARRAY LONGINT(CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(CC_al_CardOwnerXID;0)
	//ARRAY TEXT(<>CC_at_CardOwnerRange;0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited)
	C_DATE:C307(CCM_D_SelectedCardExpiryDate)
	C_LONGINT:C283($_l_CardOwnerIndex; $_l_CountCardOwners; $_l_CurrentWinRefOLD; $_l_Process; $_l_ProcessState; $_l_Retries; $0; $1; $2; $5; CCM_l_CurrentOwnerID)
	C_LONGINT:C283(CCM_l_CurrentOwnerTable; CCM_l_SELECTEDCARD; CCM_l_ShowSheetWindow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $3; $4; CC_t_CardOwnerName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_CardSelection")

//this method is similiar to CCM_OrderAuthorize
//in theat it display a selection of cards relating to the company or contact
//but in this case they will not do an auth
//this will be used when entering a receipt, or for displaying a list of card on a contact

If (Not:C34(<>CCM_bo_Inited))
	CCM_InitCreditCardModule
Else 
	CCM_LoadServiceProvidersV11(True:C214)
End if 



ARRAY TEXT:C222(CC_at_CardOwnerRange; 0)
ARRAY LONGINT:C221(CC_al_CardOwnerTable; 0)
ARRAY LONGINT:C221(CC_al_CardOwnerXID; 0)
CCM_l_CurrentOwnerID:=0
$0:=0
If (Count parameters:C259>=2)
	Case of 
		: ($1=Table:C252(->[CONTACTS:1]))
			If (Count parameters:C259>=3)
				If ([CONTACTS:1]Contact_Code:2#$3)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$3)
				End if 
			Else 
				If ([CONTACTS:1]x_ID:33#$2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$2)
				End if 
			End if 
			
			INSERT IN ARRAY:C227(CC_at_CardOwnerRange; Size of array:C274(CC_at_CardOwnerRange)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerTable; Size of array:C274(CC_al_CardOwnerTable)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerXID; Size of array:C274(CC_al_CardOwnerXID)+1; 1)
			CC_at_CardOwnerRange{Size of array:C274(CC_at_CardOwnerRange)}:=[CONTACTS:1]Contact_Name:31
			CC_al_CardOwnerTable{Size of array:C274(CC_al_CardOwnerTable)}:=Table:C252(->[CONTACTS:1])
			CC_al_CardOwnerXID{Size of array:C274(CC_al_CardOwnerXID)}:=[CONTACTS:1]x_ID:33
			If (CCM_l_CurrentOwnerID=0)
				CCM_l_CurrentOwnerTable:=Table:C252(->[CONTACTS:1])
				CCM_l_CurrentOwnerID:=[CONTACTS:1]x_ID:33
				CC_t_CardOwnerName:=[CONTACTS:1]Contact_Name:31
			End if 
			If (<>CCM_bo_CompanyCards)
				If (Count parameters:C259>=5)
					If ($5#0)
						//user can select other cards within the company.
						//Load names of Contacts_In the company with company cards.
						$_l_Retries:=0
						While (Semaphore:C143("$LoadingCards"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*(1+$_l_Retries))
						End while 
						$_l_Process:=New process:C317("CCM_LoadCompanyContacts"; 128000; "LoadCompanyContacts"; [CONTACTS:1]x_ID:33; $5)
						$_l_Retries:=0
						Repeat 
							$_l_ProcessState:=Process state:C330($_l_Process)
							If ($_l_ProcessState>=0)
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*(1+$_l_Retries))
							End if 
						Until ($_l_ProcessState<0)
						$_l_CountCardOwners:=Size of array:C274(<>CC_at_CardOwnerRange)
						If ($_l_CountCardOwners>0)
							ARRAY TEXT:C222(CC_at_CardOwnerRange; $_l_CountCardOwners+1)
							ARRAY LONGINT:C221(CC_al_CardOwnerTable; $_l_CountCardOwners+1)
							ARRAY LONGINT:C221(CC_al_CardOwnerXID; $_l_CountCardOwners+1)
							For ($_l_CardOwnerIndex; 1; Size of array:C274(<>CC_at_CardOwnerRange))
								CC_at_CardOwnerRange{$_l_CardOwnerIndex+1}:=<>CC_at_CardOwnerRange{$_l_CardOwnerIndex}
								CC_al_CardOwnerTable{$_l_CardOwnerIndex+1}:=<>CC_al_CardOwnerTable{$_l_CardOwnerIndex}
								CC_al_CardOwnerXID{$_l_CardOwnerIndex+1}:=<>CC_al_CardOwnerXID{$_l_CardOwnerIndex}
							End for 
							
						End if 
						
						CLEAR SEMAPHORE:C144("$LoadingCards")
						
						
					End if 
				End if 
			End if 
			
		: ($1=Table:C252(->[COMPANIES:2]))
			If ([COMPANIES:2]Company_Code:1#$3)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$3)
				
			End if 
			INSERT IN ARRAY:C227(CC_at_CardOwnerRange; Size of array:C274(CC_at_CardOwnerRange)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerTable; Size of array:C274(CC_al_CardOwnerTable)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerXID; Size of array:C274(CC_al_CardOwnerXID)+1; 1)
			CC_at_CardOwnerRange{Size of array:C274(CC_at_CardOwnerRange)}:=[COMPANIES:2]Company_Name:2
			CC_al_CardOwnerTable{Size of array:C274(CC_al_CardOwnerTable)}:=Table:C252(->[COMPANIES:2])
			CC_al_CardOwnerXID{Size of array:C274(CC_al_CardOwnerXID)}:=[COMPANIES:2]x_ID:63
			CCM_l_CurrentOwnerTable:=Table:C252(->[COMPANIES:2])
			CCM_l_CurrentOwnerID:=[COMPANIES:2]x_ID:63
			CC_t_CardOwnerName:=[COMPANIES:2]Company_Name:2
			
	End case 
	// I will need to add a context to this so if going to get money a card must be selected
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	If (CCM_l_ShowSheetWindow=1)
		If (Macintosh)
			WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen width:C187/2); 100; 100; 4)
		Else 
			WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen width:C187/2); 100; 100; 4)
		End if 
	Else 
		WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen width:C187/2); 100; 100; 4)
	End if 
	CCM_l_SelectedCard:=0
	CCM_D_SelectedCardExpiryDate:=!00-00-00!  //added kmw 22/08/08
	If (Count parameters:C259>=4)
		SET WINDOW TITLE:C213($4)
		
	Else 
		SET WINDOW TITLE:C213("Credit Card Details")
	End if 
	
	DIALOG:C40([USER:15]; "CCM_CardsListing")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	
	$0:=CCM_l_SelectedCard
End if 
ERR_MethodTrackerReturn("CCM_CardSelection"; $_t_oldMethodName)