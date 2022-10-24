import React from "react";
import styles from '../styles/Home.module.css';

export const Footer = () => {
    return <div className={styles.footer}><p>LΩ just playing around :) {new Date().getFullYear()}</p></div>;
}