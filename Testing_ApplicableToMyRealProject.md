# Chapter: Testing

## Overview
This chapter documents the comprehensive testing approach employed during the development and deployment of the Applicant Tracking Portal (APT). The testing strategy encompasses both Black Box Testing and White Box Testing methodologies to ensure functional correctness, data integrity, and system reliability. Multiple test scenarios were executed across different modules including user authentication, form validation, CV parsing, and applicant filtering mechanisms.

---

## Black Box Testing

Black Box Testing focuses on validating the functional behavior of the application from an end-user perspective without examining the internal code structure. This testing approach ensures that all user-facing features work correctly and provide appropriate feedback.

### 1. Registration Page Client-Side Validation Testing

The registration form implements comprehensive client-side validation to ensure data integrity before submission. We tested the validation mechanisms for all input fields including name, email, contact number, address, username, and password. Each field was tested with both valid and invalid inputs to verify proper error messaging. The validation rules check for correct email format using regex patterns, ensuring contact numbers follow the Indian format (6-9 followed by 9 digits), and passwords contain at least 8 characters with uppercase, lowercase, digits, and special characters. Invalid submissions were rejected with clear error messages, while valid data was successfully submitted and processed on the server-side.

---

## White Box Testing

### 3. CV Parsing and Text Extraction Logic

The CV parsing module was tested with multiple PDF and DOCX files containing varying formats, fonts, and text layouts. The text extraction functionality was validated to correctly identify and extract relevant sections such as education, skills, work experience, and contact information. Test cases included CVs with tables, multi-column layouts, and images to ensure the parser robustly handles diverse document structures. The module was tested for handling corrupted or encrypted PDF files with appropriate error handling without crashing the application.

### 4. Keyword Matching and Qualification Analysis

The machine learning-based keyword matching algorithm was tested using the K-Nearest Neighbors (KNN) vectorizer to verify accurate identification of required skills in parsed CV content. Test cases included exact keyword matches, partial matches, and synonymous terms (e.g., "Python programming" matching "Python"). The matching confidence score calculation was validated against manually verified results to ensure accuracy. Testing included scenarios with multiple keywords to verify the algorithm correctly identifies candidates with complete or partial skill matches, enabling staff to prioritize qualified applicants.

### 9. ML-Based Applicant Ranking Integration

Integration testing of the machine learning module with the applicant filtering system verified that CV scoring calculations are correctly integrated into the search results display. The ranking algorithm was tested to ensure applicants matching more keywords appear higher in results, and matching confidence scores are accurately displayed. Test cases included CVs with varying levels of keyword matches to validate the scoring accuracy. The integration was verified to handle ML model loading errors gracefully and fall back to standard filtering if the ML module is unavailable.