import React, { useEffect } from 'react';
import './SplashScreen.css';
import logo from '../../assets/images/logo192.png';

const SplashScreen = ({ onFinish }) => {
  useEffect(() => {
    const timer = setTimeout(() => {
      onFinish();
    }, 3000);
    return () => clearTimeout(timer);
  }, [onFinish]);

  return (
    <div className="splash-screen">
      <div className="splash-content">
        <img 
          src={logo} 
          alt="Luxury Shopping Logo" 
          className="pulse-logo"
        />
      </div>
    </div>
  );
};

export default SplashScreen;