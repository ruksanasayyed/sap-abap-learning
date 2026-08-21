# 💙 Chapter 04 – ABAP Syntax & Internal Tables

## 📖 Introduction

This chapter marks my transition from SAP Data Dictionary concepts into practical ABAP programming.

I started with basic ABAP syntax and gradually moved into working with internal tables and their operations.

---

## 📚 Topics Covered

### ABAP Basics

- Variables
- Naming conventions
- Elementary Data Types
- Type C – Character
- Type N – Numeric Text
- Type I – Integer
- Type P – Packed Number
- Constants
- System Fields (`SY-*`)

### Internal Tables

- Internal Tables vs Database Tables
- Standard Internal Tables
- Sorted Internal Tables
- Hashed Internal Tables
- Work Areas
- Custom Structures using `TYPES`
- `APPEND`
- `INSERT`
- `LOOP AT`
- `MODIFY`
- `DESCRIBE TABLE`
- `DELETE`
- `DELETE ADJACENT DUPLICATES`
- `SORT`
- `READ TABLE`
- Linear Search
- Binary Search
- Reading by Index
- `SY-SUBRC`
- `COLLECT`

---

### Conditional & Looping Statements

- `IF`
- `IF ... ELSE`
- `IF ... ELSEIF ... ELSE`
- Multiple Conditions using `AND` and `OR`
- Nested Conditions
- `CASE`
- `DO ... ENDDO`
- `WHILE ... ENDWHILE`
- `EXIT`
- `CONTINUE`
- `SY-TABIX`
- `SY-DATUM`
- Selection-screen Parameters
- Subroutines using `FORM` and `PERFORM`


## 🛠️ Practical Work

I created ABAP programs in SE38 to practice the concepts learned in this chapter.

The practical work includes internal table operations, sorted and hashed tables, `COLLECT`, conditional statements, and looping statements.

I also practiced selection-screen parameters, subroutines, `EXIT`, `CONTINUE`, and system fields such as `SY-DATUM` and `SY-TABIX`.

---

## 💻 Practice Programs

### Internal Table Practice

`ZABAP_INTERNAL_TABLES_SYNTAX`

Covers internal table declaration, structures, records, and basic internal table operations.

### COLLECT Practice

`ZABAP_COLLECT_SYNTAX`

Demonstrates the `COLLECT` statement using employee department, salary, and company code data.

### Sorted Table Practice

`ZABAP_SORTED_TABLE_SYNTAX`

Demonstrates sorted internal tables, table keys, insertion, looping, and reading records.

### Hashed Table Practice

`ZABAP_HASHED_TABLE_SYNTAX`

Demonstrates hashed internal tables, unique keys, insertion, looping, and key-based reading.

### Conditional Statements Practice

`ZABAP_CONDITIONAL_STATEMENTS`

Demonstrates `IF`, `IF...ELSE`, `ELSEIF`, nested conditions, `CASE`, `DO...ENDDO`, `WHILE`, `EXIT`, and `CONTINUE`.

All practice programs are available in the `src` folder.

## 🎯 Current Progress

- ✅ ABAP Variables
- ✅ Elementary Data Types
- ✅ Constants
- ✅ System Fields
- ✅ Internal Tables
- ✅ Standard Internal Tables
- ✅ Sorted Internal Tables
- ✅ Hashed Internal Tables
- ✅ Work Areas
- ✅ Internal Table Operations
- ✅ Conditional Statements
- ✅ Looping Statements
- 🚧 Further ABAP Syntax

---

## 🚀 What's Next

Continue with ABAP syntax and practical programming, while gradually moving toward ABAP reporting concepts such as ALV reports.