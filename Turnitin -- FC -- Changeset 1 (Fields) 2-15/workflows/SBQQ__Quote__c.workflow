<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Quote_Type</fullName>
        <field>SBQQ__Type__c</field>
        <literalValue>Renewal</literalValue>
        <name>Update Quote Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_Type_For_New_Business</fullName>
        <field>SBQQ__Type__c</field>
        <literalValue>Quote</literalValue>
        <name>Update Quote Type For New Business</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change Quote type to renewal</fullName>
        <actions>
            <name>Update_Quote_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SBQQ__Quote__c.Opportunity_Record_Type__c</field>
            <operation>equals</operation>
            <value>Renewal Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notEqual</operation>
            <value>sfdcbatchuser@turnitin.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>SBQQ__Quote__c.SBQQ__Type__c</field>
            <operation>notEqual</operation>
            <value>Amendment,Change Order</value>
        </criteriaItems>
        <description>Change Quote type to Renewal If the related Opportunity Recordtype Is Renewal</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change QuoteType For New Business Opportunity</fullName>
        <actions>
            <name>Update_Quote_Type_For_New_Business</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SBQQ__Quote__c.Opportunity_Record_Type__c</field>
            <operation>equals</operation>
            <value>New business</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notEqual</operation>
            <value>sfdcbatchuser@turnitin.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>SBQQ__Quote__c.SBQQ__Type__c</field>
            <operation>notEqual</operation>
            <value>Amendment,Change Order</value>
        </criteriaItems>
        <description>Change Quote type to Quote If the related Opportunity Record type Is New Business</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
