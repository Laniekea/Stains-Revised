import React from 'react';
import './footer.scss';

function Footer() {
  const footerText = 'Stains rebuilt @2022';
  return (
    <div className="footer">
      <div className="footer-container">
        <p>{footerText}</p>
      </div>
    </div>
  );
}

export default Footer;
