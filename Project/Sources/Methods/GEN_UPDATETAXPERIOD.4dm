//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_UPDATETAXPERIOD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_DataSets;0)
	C_BOOLEAN:C305($_bo_OK)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Index; $_l_Process)
	C_TEXT:C284($_t_DocumentName; $_t_Machine; $_t_oldMethodName; $_t_PeriodCode; $_t_ProcessName; $_t_user; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_UPDATETAXPERIOD")
//GEN_UPDATETAXPERIOD
//this method
//which will run on the server in a multi user environment
//will put the tax period onto transactions
//after printing the VAT REPORT
//   Execute on server("GEN_UPDATETAXPERIOD";32000;"UPDATING TAX PERIOD"
//;[PERIODS]To Date;"VAT RETURNTRANSET";ACC_t_PeriodTo)
MESSAGES OFF:C175
DelayTicks(60*60)

READ WRITE:C146([DATA_AUDITS:102])
If (Count parameters:C259=3)
	QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]START_DATE:3=$1; *)
	QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]DOCUMENT_NAME:5=$2)
	//  BLOB TO DOCUMENT($2;[DATA_AUDITS]DATA)
	ARRAY LONGINT:C221(WS_al_DataSets; 0)
	BLOB TO VARIABLE:C533([DATA_AUDITS:102]DATA:6; WS_al_DataSets)
	CREATE SELECTION FROM ARRAY:C640([TRANSACTIONS:29]; WS_al_DataSets)
	CREATE SET:C116([TRANSACTIONS:29]; "TAXSET")
	$_bo_OK:=True:C214
	$_t_DocumentName:=$2
	$_t_PeriodCode:=$3
Else 
	$_bo_OK:=False:C215
	QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]END_DATE:4=!00-00-00!; *)
	QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]TABLE_NUMBER:2=-2)
	If (Records in selection:C76([DATA_AUDITS:102])>0)
		$_t_DocumentName:=[DATA_AUDITS:102]DOCUMENT_NAME:5
		READ ONLY:C145([PERIODS:33])
		QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4=[DATA_AUDITS:102]START_DATE:3)
		ARRAY LONGINT:C221(WS_al_DataSets; 0)
		BLOB TO VARIABLE:C533([DATA_AUDITS:102]DATA:6; WS_al_DataSets)
		CREATE SELECTION FROM ARRAY:C640([TRANSACTIONS:29]; WS_al_DataSets)
		
		$_bo_OK:=True:C214
		CREATE SET:C116([TRANSACTIONS:29]; "TAXSET")
		$_t_PeriodCode:=[PERIODS:33]Period_Code:1
		UNLOAD RECORD:C212([PERIODS:33])
		
		
		
	End if 
End if 
If ($_bo_OK)
	
	
	READ WRITE:C146([TRANSACTIONS:29])
	//WE NOW HAVE THE RECORDS WE NEED TO WRITE TO
	USE SET:C118("TaxSet")
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[TRANSACTIONS:29])
		APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27:=$_t_PeriodCode)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
	Else 
		FIRST RECORD:C50([TRANSACTIONS:29])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
			[TRANSACTIONS:29]Tax_Period:27:=$_t_PeriodCode
			DB_SaveRecord(->[TRANSACTIONS:29])
			AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
			NEXT RECORD:C51([TRANSACTIONS:29])
		End for 
	End if 
	USE SET:C118("TaxSet")
	QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27#$_t_PeriodCode)
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		CREATE SET:C116([TRANSACTIONS:29]; "TaxSet")
		For ($_l_Index; 1; Records in set:C195("TAXSET"))
			USE SET:C118("TAXSET")
			GOTO SELECTED RECORD:C245([TRANSACTIONS:29]; $_l_Index)
			LOAD RECORD:C52([TRANSACTIONS:29])
			$_bo_OK:=True:C214
			While ($_bo_OK=True:C214)
				$_bo_OK:=(Locked:C147([TRANSACTIONS:29]))
				If ($_bo_OK)
					//I HAVE SEEN 4D TELL ME A RECORDS IS LOCKED-WHEN IT NOT
					LOCKED BY:C353([TRANSACTIONS:29]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
					If ($_l_Process=Current process:C322) & ($_t_user=Current user:C182) | ($_l_Process=0)
						//THEN ITS NOT REALLY LOCKED
						$_bo_OK:=False:C215
					End if 
				End if 
			End while 
			[TRANSACTIONS:29]Tax_Period:27:=$_t_PeriodCode
			DB_SaveRecord(->[TRANSACTIONS:29])
			AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
			UNLOAD RECORD:C212([TRANSACTIONS:29])
		End for 
		USE SET:C118("TaxSet")
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27#$_t_PeriodCode)
	End if 
	//THIS IS SLOWER THE ARRAY TO SELECTION
	//BUT ARRAY TO SELECTION CAN FAIL WITH BIG ARRAYS
	If (Records in selection:C76([TRANSACTIONS:29])=0)
		[DATA_AUDITS:102]END_DATE:4:=Current date:C33(*)
		DB_SaveRecord(->[DATA_AUDITS:102])
		AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
	End if 
	
	UNLOAD RECORD:C212([DATA_AUDITS:102])
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("GEN_UPDATETAXPERIOD"; $_t_oldMethodName)