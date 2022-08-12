//%attributes = {}

If (False:C215)
	//Database Method Name:      Trend_GetTelephoneData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(TEL_ai_amaFlags;0)
	//ARRAY INTEGER(TEL_ai_BillingSeconds;0)
	//ARRAY INTEGER(TEL_ai_Duration;0)
	//ARRAY TEXT(TEL_at_Account;0)
	//ARRAY TEXT(TEL_at_CallID;0)
	//ARRAY TEXT(TEL_at_CallSource;0)
	//ARRAY TEXT(TEL_at_CName;0)
	//ARRAY TEXT(TEL_at_Cnum;0)
	//ARRAY TEXT(TEL_at_DateTime;0)
	//ARRAY TEXT(TEL_at_Destination;0)
	//ARRAY TEXT(TEL_at_did;0)
	//ARRAY TEXT(TEL_at_Disposition;0)
	//ARRAY TEXT(TEL_at_DSTCName;0)
	//ARRAY TEXT(TEL_at_LastApp;0)
	//ARRAY TEXT(TEL_at_LastData;0)
	//ARRAY TEXT(TEL_at_OutCName;0)
	//ARRAY TEXT(TEL_at_OutCNum;0)
	//ARRAY TEXT(TEL_at_Recoding;0)
	//ARRAY TEXT(TEL_at_UserFIeld;0)
	//ARRAY TEXT(TEL_at_UUID;0)
	C_TEXT:C284($_t_oldMethodName; $_t_SQL; $_T_SQLTEXT)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Trend_GetTelephoneData")

//SQL LOGIN  //("ODBC:200.28.11.10:3308";"trendaccess";"Y0urD8t8b8s3Access")
//SQL LOGIN("IP:200.28.9.2";"sjp";"jazz")
//SQL LOGIN

//SQL LOGIN("ODBC:200.28.11.10:3306";"trendaccess";"Y0urD8t8b8s3Access")
///$_T_SQLTEXT:="Select all calldate,clid,src,dst,dcontext,channel,dstchannel,lastapp,lastdata,duration,billsec,disposition,amaflags,accountcode,uniqueid,userfield,did,recordingfile,cnum,cnam,outbound_cnum,outbound_cnam,dst_cnam"
//$_t_SQL:=$_t_SQL+" From cdr"""
//SQL EXECUTE($_T_SQLTEXT;TEL_at_DateTime;TEL_at_CallID;TEL_at_CallSource;TEL_at_Destination;TEL_at_LastApp;TEL_at_LastData;TEL_ai_Duration;TEL_ai_BillingSeconds;TEL_at_Disposition;TEL_ai_amaFlags;TEL_at_Account;TEL_at_UUID;TEL_at_UserFIeld;TEL_at_did;TEL_at_Recoding;TEL_at_Cnum;TEL_at_CName;TEL_at_OutCNum;TEL_at_OutCName;TEL_at_DSTCName)
SQL LOGOUT:C872
ERR_MethodTrackerReturn("Trend_GetTelephoneData"; $_t_oldMethodName)
